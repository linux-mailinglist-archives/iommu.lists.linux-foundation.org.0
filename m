Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD12318602
	for <lists.iommu@lfdr.de>; Thu, 11 Feb 2021 09:01:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 73F3687414;
	Thu, 11 Feb 2021 08:01:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r8+zIYJeA+dX; Thu, 11 Feb 2021 08:01:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4B6F687411;
	Thu, 11 Feb 2021 08:01:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EE4FC013A;
	Thu, 11 Feb 2021 08:01:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64848C013A
 for <iommu@lists.linux-foundation.org>; Thu, 11 Feb 2021 08:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4ED5D6F4F9
 for <iommu@lists.linux-foundation.org>; Thu, 11 Feb 2021 08:01:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QaYNbEBcJ4Ma for <iommu@lists.linux-foundation.org>;
 Thu, 11 Feb 2021 08:01:52 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id 9C9216F501; Thu, 11 Feb 2021 08:01:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5189B6EE12
 for <iommu@lists.linux-foundation.org>; Thu, 11 Feb 2021 08:01:51 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7E66068B02; Thu, 11 Feb 2021 09:01:48 +0100 (CET)
Date: Thu, 11 Feb 2021 09:01:48 +0100
From: Christoph Hellwig <hch@lst.de>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 2/3] arm64/hugetlb: Enable HUGETLB_PAGE_SIZE_VARIABLE
Message-ID: <20210211080148.GB14448@lst.de>
References: <1613024531-19040-1-git-send-email-anshuman.khandual@arm.com>
 <1613024531-19040-3-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1613024531-19040-3-git-send-email-anshuman.khandual@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org, catalin.marinas@arm.com,
 akpm@linux-foundation.org, will@kernel.org, Christoph Hellwig <hch@lst.de>,
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

On Thu, Feb 11, 2021 at 11:52:10AM +0530, Anshuman Khandual wrote:
> MAX_ORDER which invariably depends on FORCE_MAX_ZONEORDER can be a variable
> for a given page size, depending on whether TRANSPARENT_HUGEPAGE is enabled
> or not. In certain page size and THP combinations HUGETLB_PAGE_ORDER can be
> greater than MAX_ORDER, making it unusable as pageblock_order.
> 
> This enables HUGETLB_PAGE_SIZE_VARIABLE making pageblock_order a variable
> rather than the compile time constant HUGETLB_PAGE_ORDER which could break
> MAX_ORDER rule for certain configurations.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/Kconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index f39568b28ec1..8e3a5578f663 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1909,6 +1909,10 @@ config ARCH_ENABLE_THP_MIGRATION
>  	def_bool y
>  	depends on TRANSPARENT_HUGEPAGE
>  
> +config HUGETLB_PAGE_SIZE_VARIABLE

Please move the definition of HUGETLB_PAGE_SIZE_VARIABLE to
mm/Kconfig and select it from the arch Kconfigfs instead of duplicating
the definition.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
