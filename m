Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E6EA3405
	for <lists.iommu@lfdr.de>; Fri, 30 Aug 2019 11:31:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 07BE15D15;
	Fri, 30 Aug 2019 09:31:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 036465D0B
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 09:29:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2A0A6EC
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 09:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iNRAllMjt31eu9zy7JGxTVD30r/pdrKbydJfDQMe+J4=;
	b=rX91iRiZdjWC6hoEnFRS722J7
	SxkVBjFqteo8x9SyP1WwxzAUhpdtDP6JUGf4YUVNw2FjPQDcLvqhx+qXP7i+yRxS4m1zYftTCD+Lb
	VJPySWDVwhhg/uVPVl6RNAl+Ihny0mGimC9joQ/FwKkq72afk+2brrX+AuRHDeJfksb68IguU1XA8
	X0cZMOtIX5rhG3RxYQy6WgHwMYkgK549LYEMnWnJyiRrvqT8McRuTwpBYQl8Jk6hyWU0Q2JVe+8a9
	ioX8r92Eu0VH22YGnHjJdo54nhCQM5OPDIPnawLCt5RXmAKMVRtoHo/JjoENzGpi68fZkOjv118n6
	Pzpy0EqUQ==;
Received: from shell.armlinux.org.uk
	([2002:4e20:1eda:1:5054:ff:fe00:4ec]:35292)
	by pandora.armlinux.org.uk with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
	(envelope-from <linux@armlinux.org.uk>)
	id 1i3dDh-0005xS-IE; Fri, 30 Aug 2019 10:29:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1i3dDb-0008ON-0E; Fri, 30 Aug 2019 10:29:19 +0100
Date: Fri, 30 Aug 2019 10:29:18 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/4] vmalloc: lift the arm flag for coherent mappings to
	common code
Message-ID: <20190830092918.GV13294@shell.armlinux.org.uk>
References: <20190830062924.21714-1-hch@lst.de>
	<20190830062924.21714-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190830062924.21714-2-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-xtensa@linux-xtensa.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, iommu@lists.linux-foundation.org,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

On Fri, Aug 30, 2019 at 08:29:21AM +0200, Christoph Hellwig wrote:
> The arm architecture had a VM_ARM_DMA_CONSISTENT flag to mark DMA
> coherent remapping for a while.  Lift this flag to common code so
> that we can use it generically.  We also check it in the only place
> VM_USERMAP is directly check so that we can entirely replace that
> flag as well (although I'm not even sure why we'd want to allow
> remapping DMA appings, but I'd rather not change behavior).

Good, because if you did change that behaviour, you'd break almost
every ARM framebuffer and cripple ARM audio drivers.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
