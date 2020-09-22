Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B439B274C2F
	for <lists.iommu@lfdr.de>; Wed, 23 Sep 2020 00:37:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 698A187093;
	Tue, 22 Sep 2020 22:37:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bEE3Z8a-onZ9; Tue, 22 Sep 2020 22:37:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D267C8706C;
	Tue, 22 Sep 2020 22:37:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C490EC0051;
	Tue, 22 Sep 2020 22:37:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9AD8BC0051
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 22:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8361C85764
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 22:37:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QIuce9inztSw for <iommu@lists.linux-foundation.org>;
 Tue, 22 Sep 2020 22:37:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2F71C8577C
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 22:37:10 +0000 (UTC)
Received: from [192.168.1.171] (50-39-235-197.bvtn.or.frontiernet.net
 [50.39.235.197])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1508920B7179;
 Tue, 22 Sep 2020 15:37:09 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1508920B7179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1600814229;
 bh=ClwMIaEy1QkOug3GZQC9xiEgNvcZxX8uczkxLFHFqh8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LZItGfNojTl6mkytfVVoC0bv8uWfNuAm4O+yL0CV3M1p16sUodwOl7UeKSdCC3Jjp
 jDiDKmyPNrCyl41pbnvRZlnSU0S4/EDIHlVoJeBNGZp5hyVL218Z6QDyqjHYrIus+A
 d94Y64Yk3ZocNDV8HOZqm7ZAlTv8QChWSIONOCIo=
Subject: Re: [PATCH v2] iommu/arm: Add module parameter to set msi iova address
To: Will Deacon <will@kernel.org>
References: <20200914181307.117792-1-vemegava@linux.microsoft.com>
 <20200921204545.GA3811@willie-the-truck>
From: Vennila Megavannan <vemegava@linux.microsoft.com>
Message-ID: <f2de12f9-b53b-abcd-4133-7bcb90341f0c@linux.microsoft.com>
Date: Tue, 22 Sep 2020 15:37:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200921204545.GA3811@willie-the-truck>
Content-Language: en-US
Cc: jean-philippe@linaro.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, tyhicks@linux.microsoft.com,
 srinath.mannam@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Sure, that's a great suggestion, I'll rework on the patch and post again.

Vennila

On 9/21/2020 1:45 PM, Will Deacon wrote:
> On Mon, Sep 14, 2020 at 11:13:07AM -0700, Vennila Megavannan wrote:
>> From: Srinath Mannam <srinath.mannam@broadcom.com>
>>
>> Add provision to change default value of MSI IOVA base to platform's
>> suitable IOVA using module parameter. The present hardcoded MSI IOVA base
>> may not be the accessible IOVA ranges of platform.
>>
>> If any platform has the limitaion to access default MSI IOVA, then it can
>> be changed using "arm-smmu.msi_iova_base=0xa0000000" command line argument.
>>
>> Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
>> Co-developed-by: Vennila Megavannan <vemegava@linux.microsoft.com>
>> Signed-off-by: Vennila Megavannan <vemegava@linux.microsoft.com>
>> ---
>>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 5 ++++-
>>   drivers/iommu/arm/arm-smmu/arm-smmu.c       | 5 ++++-
>>   2 files changed, 8 insertions(+), 2 deletions(-)
> This feels pretty fragile. Wouldn't it be better to realise that there's
> a region conflict with iommu_dma_get_resv_regions() and move the MSI window
> accordingly at runtime?
>
> Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
