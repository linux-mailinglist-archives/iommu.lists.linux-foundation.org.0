Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 721AD90758
	for <lists.iommu@lfdr.de>; Fri, 16 Aug 2019 19:59:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B7182C2C;
	Fri, 16 Aug 2019 17:59:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4D95AC2C
	for <iommu@lists.linux-foundation.org>;
	Fri, 16 Aug 2019 17:59:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D0BACE5
	for <iommu@lists.linux-foundation.org>;
	Fri, 16 Aug 2019 17:59:46 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 94E9A68B05; Fri, 16 Aug 2019 19:59:42 +0200 (CEST)
Date: Fri, 16 Aug 2019 19:59:42 +0200
From: Christoph Hellwig <hch@lst.de>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH 6/6] arm64: document the choice of page attributes for
	pgprot_dmacoherent
Message-ID: <20190816175942.GA4879@lst.de>
References: <20190816070754.15653-1-hch@lst.de>
	<20190816070754.15653-7-hch@lst.de>
	<20190816173118.4rbbzuogfamfa554@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816173118.4rbbzuogfamfa554@willie-the-truck>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Shawn Anastasio <shawn@anastas.io>, linux-m68k@lists.linux-m68k.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org,
	iommu@lists.linux-foundation.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Paul Burton <paul.burton@mips.com>,
	James Hogan <jhogan@kernel.org>, Guan Xuetao <gxt@pku.edu.cn>,
	Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>
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

On Fri, Aug 16, 2019 at 06:31:18PM +0100, Will Deacon wrote:
> Mind if I tweak the second sentence to be:
> 
>   This is different from "Device-nGnR[nE]" memory which is intended for MMIO
>   and thus forbids speculation, preserves access size, requires strict
>   alignment and can also force write responses to come from the endpoint.
> 
> ? It's a small change, but it better fits with the arm64 terminology
> ("strongly ordered" is no longer used in the architecture).
> 
> If you're happy with that, I can make the change and queue this patch
> for 5.4.

I'm fine with the change, but you really need this series as base,
as there is no pgprot_dmacoherent before the series.  So I think I'll
have to queue it up if we want it for 5.4, and I'll need a few more
reviews for the other patches in this series first.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
