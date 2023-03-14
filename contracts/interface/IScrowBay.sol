// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

/**
  @dev this is the interface of the users.
 */

interface IScrowBay {
    enum Status {
        Lock,
        Disputed,
        Released
    }

    struct Transaction {
        bytes32 title;
        address buyer;
        address seller;
        address token;
        uint256 amount;
        uint256 time;
        Status status;
    }

    function createTransaction(
        bytes32 _title,
        address _seller,
        address _token,
        address _amount
    ) external returns (uint256 transactionId_);

    function createTransaction(
        bytes32 _title,
        address _seller
    ) external payable returns (uint256 transactionId_);

    function getTransaction(
        uint256 _transactionId
    ) external view returns (Transaction memory transaction_);

    function releaseTransaction(uint256 _transactionId) external;

    function withdraw(uint256 _transactionId) external;
}
