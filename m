Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3546E2C3961
	for <lists.iommu@lfdr.de>; Wed, 25 Nov 2020 07:58:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D009E27230;
	Wed, 25 Nov 2020 06:58:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9-ScAzfS9ezF; Wed, 25 Nov 2020 06:58:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3CCA220404;
	Wed, 25 Nov 2020 06:58:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16861C0052;
	Wed, 25 Nov 2020 06:58:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4EF33C0052
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 06:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3915A873A4
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 06:58:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vBGHPsloY5ux for <iommu@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 06:58:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0465C873A2
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 06:58:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606287501; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=LrICIdDLfpZKH7ljsAEC0wOYB0ntNG1+5ilRwexAuoU=;
 b=PQjKeA0JhK9kmUrOTcL41tPUOEev+pswY+SNO+gzB7BStiyuor2f+Y2AcCS+MC4uEreyW692
 IhkzeyjWBpy/5kFhfqKyS/xV7UDE+3GOEveytrWVr8G81e7FAznZd2ddYwJulYGR5qfSdWkr
 v+TYsDYQHqbdw63+bLo16WybgfI=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5fbe008b0c9500dc7b625886 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Nov 2020 06:58:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E1F81C43465; Wed, 25 Nov 2020 06:58:19 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 03716C433C6;
 Wed, 25 Nov 2020 06:58:18 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 25 Nov 2020 12:28:18 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCHv9 2/8] iommu/arm-smmu: Add domain attribute for pagetable
 configuration
In-Reply-To: <20201124214134.GB14252@willie-the-truck>
References: <cover.1606150259.git.saiprakash.ranjan@codeaurora.org>
 <122e7b3050c51ee2e3637fca0b3967b4c3dc2bac.1606150259.git.saiprakash.ranjan@codeaurora.org>
 <20201124214134.GB14252@willie-the-truck>
Message-ID: <b56ec844e2c059d0c6d8de3424a0cce7@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 dri-devel@lists.freedesktop.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 iommu@lists.linux-foundation.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2020-11-25 03:11, Will Deacon wrote:
> On Mon, Nov 23, 2020 at 10:35:55PM +0530, Sai Prakash Ranjan wrote:
>> Add iommu domain attribute for pagetable configuration which
>> initially will be used to set quirks like for system cache aka
>> last level cache to be used by client drivers like GPU to set
>> right attributes for caching the hardware pagetables into the
>> system cache and later can be extended to include other page
>> table configuration data.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 20 ++++++++++++++++++++
>>  drivers/iommu/arm/arm-smmu/arm-smmu.h |  1 +
>>  include/linux/io-pgtable.h            |  4 ++++
>>  include/linux/iommu.h                 |  1 +
>>  4 files changed, 26 insertions(+)
> 
> Given that we're heading for a v10 to address my comments on patch 3,
> then I guess you may as well split this into two patches so that I can
> share just the atttibute with Rob rather than the driver parts.
> 
> Please keep it all as one series though, with the common parts at the
> beginning, and I'll figure it out.
> 

Ok I will split up and send v10.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
