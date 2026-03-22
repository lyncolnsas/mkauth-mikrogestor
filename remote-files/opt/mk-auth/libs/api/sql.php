<?php

class SQL {

	public $total_registros = 0;
	public $total_paginas = 0;
    public $filtros;
    public $limite;
    public $pagina;
    public $parametros = array();
    public $binds = array();
    public $comandoSQL;
    public $tabela;

	const PADRAO_LIMITE	= 500;
	const PADRAO_PAGINA	= 1;

	public function __construct($filtros) {
		$this->filtros = $filtros;
		$this->limite = self::PADRAO_LIMITE;
		$this->pagina = self::PADRAO_PAGINA;
	}

	public function gerarSQL() : void {

		$comandoSQL = $this->comandoSQL;

		if ($this->filtros !== null) {
			parse_str($this->filtros, $saida);
			foreach ($saida as $parametro => $dado) {
				switch ($parametro) {
					case ('limite') :
						if (ctype_digit(strval($dado)) == true && in_array($dado, range(1,self::PADRAO_LIMITE))) $this->limite = intval($dado);
					break;
					case ('pagina') :
						if (ctype_digit(strval($dado)) == true && in_array($dado, range(1,self::PADRAO_LIMITE))) $this->pagina = intval($dado);
					break;
					default :
						$this->parametros[] = array($parametro, $dado);
					break;
				}
			}
		}

		$query_comando = '';
		if (isset($this->parametros)) {
			foreach ($this->parametros as $parametro) {
				if ($this->testaCol($parametro[0]) == true) {
					$query_comando .= (empty($query_comando)) ? ' WHERE ' : ' AND ';
					$query_comando .= $parametro[0] . ' = :' . $parametro[0] . ' ';
					switch (true) {
						case (is_bool($parametro[0])) :
							$this->binds[] = array(':' . $parametro[0], boolval($parametro[1]), PDO::PARAM_BOOL);
						break;
						case (is_int($parametro[0])) :
							$this->binds[] = array(':' . $parametro[0], intval($parametro[1]), PDO::PARAM_INT);
						break;
						default:
							$this->binds[] = array(':' . $parametro[0], strval($parametro[1]), PDO::PARAM_STR);
						break;
					}
				}
			}
		}

		if (!empty($query_comando)) $comandoSQL .= $query_comando;

		$total_registros = $this->contaSQL($query_comando);

		if ($total_registros > 0) {
	
			$comandoSQL .= ' LIMIT :limite OFFSET :offset';

			$this->total_registros = $total_registros;
			$this->total_paginas = ceil($total_registros / $this->limite);

			$offset = (($this->pagina - 1) * $this->limite);
			if ($this->pagina > $this->total_paginas) {
				$offset = ($this->total_paginas * $this->limite) - $this->limite;
				$this->pagina = $this->total_paginas;
			}

			$this->binds[] = array(':limite', $this->limite, PDO::PARAM_INT);
			$this->binds[] = array(':offset', $offset, PDO::PARAM_INT);

		}

		$this->comandoSQL = $comandoSQL;

	}

	private function contaSQL($query_contagem) : int {
		$countSQL = 'SELECT COUNT(*) AS total FROM ' . $this->tabela;
		if (!empty($query_contagem)) $countSQL .= $query_contagem;
		$rotinaCount = DB::prepare($countSQL);
		if (isset($this->binds)) {
			foreach ($this->binds as $bind) {
				$rotinaCount -> bindParam("{$bind[0]}", $bind[1], $bind[2]);
			}
		}
		$rotinaCount -> execute();
		$resultadosCount = $rotinaCount -> fetch();
		return intval($resultadosCount->total);
	}

	private function testaCol($coluna) : bool {
		$testaColuna = DB::prepare("SHOW COLUMNS FROM " . $this->tabela . " LIKE '{$coluna}'");
		$testaColuna -> execute();
		if (($testaColuna->rowCount()) > 0) return true;
		return false;
	}

}
