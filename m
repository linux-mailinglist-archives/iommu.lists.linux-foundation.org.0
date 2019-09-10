Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CC1AF0AE
	for <lists.iommu@lfdr.de>; Tue, 10 Sep 2019 19:50:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AB617E3A;
	Tue, 10 Sep 2019 17:50:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EC770D67
	for <iommu@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 17:50:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com
	[207.171.184.29])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8F4B58A8
	for <iommu@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 17:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
	t=1568137808; x=1599673808; h=from:to:subject:date:message-id;
	bh=Wd9BZT5mhRC+sg3kUmT7XieFg+66hTOzR6acJxYycRM=;
	b=PntmOjjwpKHjbptT5VQUuxAsz3zNZ4gkvPx6nCsq0zPdtl8y1HbfYHA3
	I17Qnm1KVN/2mweFBsUYXDeBLY9WsoreI5C0xnzJGklcnOr0wYFG8xK8u
	QdUDXnJSX+YbzgR4gjQ5QHP0k1NqKDu2lZv5OmqEaEQJwL6R3ypXyD+6u M=;
X-IronPort-AV: E=Sophos;i="5.64,490,1559520000"; d="scan'208";a="701858127"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
	email-inbound-relay-2c-397e131e.us-west-2.amazon.com) ([10.47.22.38])
	by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
	10 Sep 2019 17:49:38 +0000
Received: from uf8b156e456a5587c9af4.ant.amazon.com
	(pdx2-ws-svc-lb17-vlan2.amazon.com [10.247.140.66])
	by email-inbound-relay-2c-397e131e.us-west-2.amazon.com (Postfix) with
	ESMTPS id B5062A24F8; Tue, 10 Sep 2019 17:49:35 +0000 (UTC)
Received: from uf8b156e456a5587c9af4.ant.amazon.com (localhost [127.0.0.1])
	by uf8b156e456a5587c9af4.ant.amazon.com (8.15.2/8.15.2/Debian-3) with
	ESMTP id x8AHnXLb023806; Tue, 10 Sep 2019 19:49:33 +0200
Received: (from sironi@localhost)
	by uf8b156e456a5587c9af4.ant.amazon.com (8.15.2/8.15.2/Submit) id
	x8AHnXi2023801; Tue, 10 Sep 2019 19:49:33 +0200
To: sironi@amazon.de, joro@8bytes.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: iommu/amd: Flushing and locking fixes
Date: Tue, 10 Sep 2019 19:49:20 +0200
Message-Id: <1568137765-20278-1-git-send-email-sironi@amazon.de>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Development issues for Linux IOMMU support
	<iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
From: Filippo Sironi via iommu <iommu@lists.linux-foundation.org>
Reply-To: Filippo Sironi <sironi@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

This patch series introduce patches to take the domain lock whenever we call
functions that end up calling __domain_flush_pages.  Holding the domain lock is
necessary since __domain_flush_pages traverses the device list, which is
protected by the domain lock.

The first patch in the series adds a completion right after an IOTLB flush in
attach_device.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
