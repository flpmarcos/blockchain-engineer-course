// URL para compilar
//http://remix.ethereum.org/#appVersion=0.7.7&optimize=false&version=soljson-v0.4.11+commit.68ef5810.js

//ico programadormarombacoins

//versão
pragma solidity ^0.4.11;
 
contract hadcoin_ico {
 
    //número máximo de programadormarombacoins disponíveis no ICO		 
    uint public max_programadormarombacoins = 1000000;
    //Taxa cotacao do hadcoin por dolar	
    uint public usd_to_programadormarombacoins = 1000;
    //total de programadormarombacoins compradas por investidores	
    uint public total_programadormarombacoins_bought = 0;
    
    //funcoes de equivalencia
    mapping(address => uint) equity_programadormarombacoins;
    mapping(address => uint) equity_usd;
 
    //verificando se o investidor por comprar programadormarombacoins
    modifier can_buy_programadormarombacoins(uint usd_invested) {
        require (usd_invested * usd_to_programadormarombacoins + total_programadormarombacoins_bought <= max_programadormarombacoins);
        _;
    }
 
    //retorna o valor do investimento em programadormarombacoins 	
    function equity_in_programadormarombacoins(address investor) external constant returns (uint){
        return equity_programadormarombacoins[investor];
    }
 
    //retorna o valor do investimento em dolares
    function equity_in_usd(address investor) external constant returns (uint){
        return equity_usd[investor];
    }
 
    //compra de programadormarombacoins 
    function buy_programadormarombacoins(address investor, uint usd_invested) external 
    can_buy_programadormarombacoins(usd_invested) {
        uint programadormarombacoins_bought = usd_invested * usd_to_programadormarombacoins;
        equity_programadormarombacoins[investor] += programadormarombacoins_bought;
        equity_usd[investor] = equity_programadormarombacoins[investor] / 1000;
        total_programadormarombacoins_bought += programadormarombacoins_bought;
    }
 
    //venda de programadormarombacoins
    function sell_programadormarombacoins(address investor, uint programadormarombacoins_sold) external {
        equity_programadormarombacoins[investor] -= programadormarombacoins_sold;
        equity_usd[investor] = equity_programadormarombacoins[investor] / 1000;
        total_programadormarombacoins_bought -= programadormarombacoins_sold;
    }
    
    
    
    
}
