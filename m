Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F5BFB978
	for <lists.iommu@lfdr.de>; Wed, 13 Nov 2019 21:11:41 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 34D9ED8C;
	Wed, 13 Nov 2019 20:11:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 39BDBCF6
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 20:11:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 46EC18CF
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 20:11:34 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::3d5])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: davem-davemloft)
	by shards.monkeyblade.net (Postfix) with ESMTPSA id E89F91203B429;
	Wed, 13 Nov 2019 12:11:32 -0800 (PST)
Date: Wed, 13 Nov 2019 12:11:32 -0800 (PST)
Message-Id: <20191113.121132.1658930697082028145.davem@davemloft.net>
To: laurentiu.tudor@nxp.com
Subject: Re: [PATCH v3 0/4] dma-mapping: introduce new dma unmap and sync
	variants
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191113122407.1171-1-laurentiu.tudor@nxp.com>
References: <20191113122407.1171-1-laurentiu.tudor@nxp.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
	(shards.monkeyblade.net [149.20.54.216]);
	Wed, 13 Nov 2019 12:11:33 -0800 (PST)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: ruxandra.radulescu@nxp.com, madalin.bucur@nxp.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
	iommu@lists.linux-foundation.org, camelia.groza@nxp.com,
	ioana.ciornei@nxp.com, robin.murphy@arm.com, hch@lst.de
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Date: Wed, 13 Nov 2019 12:24:17 +0000

> From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> 
> This series introduces a few new dma unmap and sync api variants that,
> on top of what the originals do, return the virtual address
> corresponding to the input dma address. In order to do that a new dma
> map op is added, .get_virt_addr that takes the input dma address and
> returns the virtual address backing it up.
> The second patch adds an implementation for this new dma map op in the
> generic iommu dma glue code and wires it in.
> The third patch updates the dpaa2-eth driver to use the new apis.

The driver should store the mapping in it's private software state if
it needs this kind of conversion.

This is huge precendence for this, and there is therefore no need to
add even more complication and methods and burdon to architecture code
for the sake of this.

Thank you.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
