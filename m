Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F6F3141E
	for <lists.iommu@lfdr.de>; Fri, 31 May 2019 19:48:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5D7511861;
	Fri, 31 May 2019 17:47:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E40491815
	for <iommu@lists.linux-foundation.org>;
	Fri, 31 May 2019 17:46:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 818635F4
	for <iommu@lists.linux-foundation.org>;
	Fri, 31 May 2019 17:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sw59L5eilDcyLax1cbN/oovEq+2iPQ87MItZHDnliB8=;
	b=OcvvfIQWRmhZciRaxx8x6dnj7
	P9/7pUyMmERrI8OtitGh0I1lua9/boy6cCyy8Ladvj3L+81QcfLZA3/MpAXnqBYWumQ7OwxjHJzyW
	dYcTgnoubni9ek4e+t2NdyFiporyzaIlnP+Sqtx7nVnm4QpWkErFIuu3c//DEmHtOceqwmRR+TleY
	5xdn+M5QVBRJydb756QKcrm2LYNcpari+BbBMzfF1a1qnRAOkMBtY1ouzqY7uu11IRMQ992tj+IwH
	kTGIKLKzrT0G7yIOK0n8A8VlEo0R3dSDvfZe6tdSfdipO9HLYIyRazJqOFjrnnt5KR1OHdtFysfhd
	5WgaU7K6g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
	Hat Linux)) id 1hWlbq-00022N-4T; Fri, 31 May 2019 17:46:30 +0000
Date: Fri, 31 May 2019 10:46:30 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v3 0/6] Prerequisites for NXP LS104xA SMMU enablement
Message-ID: <20190531174629.GA6298@infradead.org>
References: <20190530141951.6704-1-laurentiu.tudor@nxp.com>
	<20190530.150844.1826796344374758568.davem@davemloft.net>
	<20190531163350.GB8708@infradead.org>
	<37406608-df48-c7a0-6975-4b4ad408ba36@arm.com>
	<20190531170804.GA12211@infradead.org>
	<1b81c168-f5e0-f86a-f90e-22e8c3f2a602@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b81c168-f5e0-f86a-f90e-22e8c3f2a602@arm.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: madalin.bucur@nxp.com, netdev@vger.kernel.org, roy.pledge@nxp.com,
	linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
	Joakim.Tjernlund@infinera.com, iommu@lists.linux-foundation.org,
	camelia.groza@nxp.com, linuxppc-dev@lists.ozlabs.org,
	David Miller <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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

On Fri, May 31, 2019 at 06:45:00PM +0100, Robin Murphy wrote:
> Bleh, I'm certainly not keen on formalising any kind of
> dma_to_phys()/dma_to_virt() interface for this. Or are you just proposing
> something like dma_unmap_sorry_sir_the_dog_ate_my_homework() for drivers
> which have 'lost' the original VA they mapped?

Yes, I guess we need that in some form.  I've heard a report the IBM
emca ethernet driver has the same issue, and any SOC with it this
totally blows up dma-debug as they just never properly unmap.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
