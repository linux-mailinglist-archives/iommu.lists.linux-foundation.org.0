Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A847280503
	for <lists.iommu@lfdr.de>; Thu,  1 Oct 2020 19:19:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5F5D787364;
	Thu,  1 Oct 2020 17:19:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ujMc6IoCcE3U; Thu,  1 Oct 2020 17:19:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0994587361;
	Thu,  1 Oct 2020 17:19:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8DD6C0051;
	Thu,  1 Oct 2020 17:19:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 817E2C0051
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 17:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6B94F86B02
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 17:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P6NxiGo6Juas for <iommu@lists.linux-foundation.org>;
 Thu,  1 Oct 2020 17:19:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CCF628685A
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 17:19:54 +0000 (UTC)
Received: from gaia (unknown [31.124.44.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BDDC620897;
 Thu,  1 Oct 2020 17:19:52 +0000 (UTC)
Date: Thu, 1 Oct 2020 18:19:50 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH 4/4] mm: Update DMA zones description
Message-ID: <20201001171950.GP21544@gaia>
References: <20201001161740.29064-1-nsaenzjulienne@suse.de>
 <20201001161740.29064-5-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201001161740.29064-5-nsaenzjulienne@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, will@kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org, robh+dt@kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, robin.murphy@arm.com, hch@lst.de,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Thu, Oct 01, 2020 at 06:17:40PM +0200, Nicolas Saenz Julienne wrote:
> The default behavior for arm64 changed, so reflect that.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
