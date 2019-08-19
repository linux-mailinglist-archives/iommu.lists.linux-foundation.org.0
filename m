Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A2E91DDE
	for <lists.iommu@lfdr.de>; Mon, 19 Aug 2019 09:33:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D8611C5D;
	Mon, 19 Aug 2019 07:32:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AAE65AF5
	for <iommu@lists.linux-foundation.org>;
	Mon, 19 Aug 2019 07:32:55 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C401986E
	for <iommu@lists.linux-foundation.org>;
	Mon, 19 Aug 2019 07:32:53 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 358142086C;
	Mon, 19 Aug 2019 07:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566199973;
	bh=2lDcf3QQwVsKtMhMZhdAAuqPtLzNgs151JSGDBAUuzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6tRAlCEy9T9B1f/Fr8dqhepWZ75Fhl8VQaANcZGYdzMgTqJwFcqVlTLJy909tybu
	RPrW2ST42+f3cgF7RF1ZGbkSknGDDVoqX/qyb5n7MDo/L7aDS8rJjVyvjCsgexBYmi
	MajDi6YVzh9HEPWR+mvVck/OTqThG4PCoWxxK8k4=
Date: Mon, 19 Aug 2019 08:32:49 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/11] arm64: use asm-generic/dma-mapping.h
Message-ID: <20190819073248.wtmnnl3mkjososvc@willie-the-truck>
References: <20190816130013.31154-1-hch@lst.de>
	<20190816130013.31154-12-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816130013.31154-12-hch@lst.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
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

On Fri, Aug 16, 2019 at 03:00:13PM +0200, Christoph Hellwig wrote:
> Now that the Xen special cases are gone nothing worth mentioning is
> left in the arm64 <asm/dma-mapping.h> file, so switch to use the
> asm-generic version instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/arm64/include/asm/Kbuild        |  1 +
>  arch/arm64/include/asm/dma-mapping.h | 22 ----------------------
>  arch/arm64/mm/dma-mapping.c          |  1 +
>  3 files changed, 2 insertions(+), 22 deletions(-)
>  delete mode 100644 arch/arm64/include/asm/dma-mapping.h

Acked-by: Will Deacon <will@kernel.org>

Thanks for cleaning this up.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
