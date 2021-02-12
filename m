Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE97319A20
	for <lists.iommu@lfdr.de>; Fri, 12 Feb 2021 08:13:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E20298751B;
	Fri, 12 Feb 2021 07:13:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ag90Sgf4IPOq; Fri, 12 Feb 2021 07:13:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 482038745D;
	Fri, 12 Feb 2021 07:13:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38598C1834;
	Fri, 12 Feb 2021 07:13:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82A0AC013A
 for <iommu@lists.linux-foundation.org>; Fri, 12 Feb 2021 07:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63BB06F477
 for <iommu@lists.linux-foundation.org>; Fri, 12 Feb 2021 07:13:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cw2p0-6HesLy for <iommu@lists.linux-foundation.org>;
 Fri, 12 Feb 2021 07:13:08 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id 90B316F56E; Fri, 12 Feb 2021 07:13:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2071F6F477
 for <iommu@lists.linux-foundation.org>; Fri, 12 Feb 2021 07:13:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5233D12FC;
 Thu, 11 Feb 2021 23:13:06 -0800 (PST)
Received: from [192.168.0.130] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF0653F73D;
 Thu, 11 Feb 2021 23:13:02 -0800 (PST)
Subject: Re: [PATCH 2/3] arm64/hugetlb: Enable HUGETLB_PAGE_SIZE_VARIABLE
To: Christoph Hellwig <hch@lst.de>
References: <1613024531-19040-1-git-send-email-anshuman.khandual@arm.com>
 <1613024531-19040-3-git-send-email-anshuman.khandual@arm.com>
 <20210211080148.GB14448@lst.de>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <768e2ee2-93a5-02ec-4842-41e1242a6bef@arm.com>
Date: Fri, 12 Feb 2021 12:43:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210211080148.GB14448@lst.de>
Content-Language: en-US
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org, catalin.marinas@arm.com,
 akpm@linux-foundation.org, will@kernel.org,
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



On 2/11/21 1:31 PM, Christoph Hellwig wrote:
> On Thu, Feb 11, 2021 at 11:52:10AM +0530, Anshuman Khandual wrote:
>> MAX_ORDER which invariably depends on FORCE_MAX_ZONEORDER can be a variable
>> for a given page size, depending on whether TRANSPARENT_HUGEPAGE is enabled
>> or not. In certain page size and THP combinations HUGETLB_PAGE_ORDER can be
>> greater than MAX_ORDER, making it unusable as pageblock_order.
>>
>> This enables HUGETLB_PAGE_SIZE_VARIABLE making pageblock_order a variable
>> rather than the compile time constant HUGETLB_PAGE_ORDER which could break
>> MAX_ORDER rule for certain configurations.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/arm64/Kconfig | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index f39568b28ec1..8e3a5578f663 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -1909,6 +1909,10 @@ config ARCH_ENABLE_THP_MIGRATION
>>  	def_bool y
>>  	depends on TRANSPARENT_HUGEPAGE
>>  
>> +config HUGETLB_PAGE_SIZE_VARIABLE
> 
> Please move the definition of HUGETLB_PAGE_SIZE_VARIABLE to
> mm/Kconfig and select it from the arch Kconfigfs instead of duplicating
> the definition.

Sure, will do.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
