Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1F33137A
	for <lists.iommu@lfdr.de>; Fri, 31 May 2019 19:09:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 912BC1836;
	Fri, 31 May 2019 17:09:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2D51F14DC
	for <iommu@lists.linux-foundation.org>;
	Fri, 31 May 2019 17:08:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D65C15F4
	for <iommu@lists.linux-foundation.org>;
	Fri, 31 May 2019 17:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KA1uUOBpqKj4QS1sNKzCJjD8A4csLtN/AKjlhA9dyZ4=;
	b=J7gr7QgfnGMd3RiwgTEO8jP6E
	ULSkOOmwWFPFnywhLdh+p2cuOeX4AQEoiphY0Ag6Z2GAfHpY6TA1iZKHiMLzXZdNrNF55KwISgO+t
	RFh629prGuE2WWI7iD2GrUHNv1edocH8eoxgliHN4oJ6mxDAYpMs+zmfPL5ORoDje5kc1bi1D/+YN
	Mne6X1vfTWc3AJh8Q7Wx+odcNye3DVIiFbQY5V0qgHQosWq/OfCKBYdl7Ttg2jDF+/TqiL5zoLAkM
	4G7bVYwc15Mku1cYtcDj5/cChhYPrOUHktIJnWGJKRYerrZV01vlPz0uNkBvJKhGYQ3oGAMmcvMe0
	jS18hNg6Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
	Hat Linux)) id 1hWl0e-0003CU-6E; Fri, 31 May 2019 17:08:04 +0000
Date: Fri, 31 May 2019 10:08:04 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v3 0/6] Prerequisites for NXP LS104xA SMMU enablement
Message-ID: <20190531170804.GA12211@infradead.org>
References: <20190530141951.6704-1-laurentiu.tudor@nxp.com>
	<20190530.150844.1826796344374758568.davem@davemloft.net>
	<20190531163350.GB8708@infradead.org>
	<37406608-df48-c7a0-6975-4b4ad408ba36@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <37406608-df48-c7a0-6975-4b4ad408ba36@arm.com>
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

On Fri, May 31, 2019 at 06:03:30PM +0100, Robin Murphy wrote:
> > The thing needs to be completely redone as it abuses parts of the
> > iommu API in a completely unacceptable way.
> 
> `git grep iommu_iova_to_phys drivers/{crypto,gpu,net}`
> 
> :(
> 
> I guess one alternative is for the offending drivers to maintain their own
> lookup tables of mapped DMA addresses - I think at least some of these
> things allow storing some kind of token in a descriptor, which even if it's
> not big enough for a virtual address might be sufficient for an index.

Well, we'll at least need DMA API wrappers that work on the dma addr
only and hide this madness underneath.  And then tell if an given device
supports this and fail the probe otherwise.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
