Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1962152334
	for <lists.iommu@lfdr.de>; Tue, 25 Jun 2019 07:55:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 44E208E2;
	Tue, 25 Jun 2019 05:55:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 55292255
	for <iommu@lists.linux-foundation.org>;
	Tue, 25 Jun 2019 05:55:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 01FD9710
	for <iommu@lists.linux-foundation.org>;
	Tue, 25 Jun 2019 05:55:19 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 0241C68B02; Tue, 25 Jun 2019 07:54:48 +0200 (CEST)
Date: Tue, 25 Jun 2019 07:54:47 +0200
From: Christoph Hellwig <hch@lst.de>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH 1/2] dma-mapping: truncate dma masks to what dma_addr_t
	can hold
Message-ID: <20190625055447.GC28854@lst.de>
References: <20190521124729.23559-1-hch@lst.de>
	<20190521124729.23559-2-hch@lst.de>
	<20190521130436.bgt53bf7nshz62ip@shell.armlinux.org.uk>
	<20190521131503.GA5258@lst.de> <20190529122219.GA9982@lst.de>
	<20190614074648.GA9282@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614074648.GA9282@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Fri, Jun 14, 2019 at 09:46:48AM +0200, Christoph Hellwig wrote:
> If I don't hear anything back in the next days I will just merge
> these patches, please comment.

Applied to the dma-mapping for-next tree now.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
