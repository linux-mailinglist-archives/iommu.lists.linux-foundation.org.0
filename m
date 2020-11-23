Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AD12C1132
	for <lists.iommu@lfdr.de>; Mon, 23 Nov 2020 18:02:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5FCA385E85;
	Mon, 23 Nov 2020 17:02:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JVOG14DCnGpy; Mon, 23 Nov 2020 17:02:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E2A3B85D95;
	Mon, 23 Nov 2020 17:02:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DAC51C0052;
	Mon, 23 Nov 2020 17:02:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96DB1C0052
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 17:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 805E387026
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 17:02:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2c8Dj8SICh0t for <iommu@lists.linux-foundation.org>;
 Mon, 23 Nov 2020 17:02:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BF486870E8
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 17:02:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606150928; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=OMLlds5ZASBxc6VI9c5Wt8OmEB5BECKe6YXf0Nc2/+A=;
 b=dmrmNaX1edMclSQXezDLfNqLnNbD7YC23ZQ0WFnXtZ5WRX6qqz/dwjuBw8DVT6BMfJ+Ir7OQ
 HdqXWrzpCQZETMBUR9upE0Sior+7yTNLzQCwucr/oe3PvzifTFLrKKk39mZlq/jcRd9nazs+
 jqoXWetbkDXJB7kxiY+tj1Kb+uA=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5fbbeafe77b63cdb34206c2f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 17:01:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D1DCAC43467; Mon, 23 Nov 2020 17:01:49 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0A71EC433C6;
 Mon, 23 Nov 2020 17:01:48 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 23 Nov 2020 22:31:48 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCHv8 0/8] System Cache support for GPU and required SMMU
 support
In-Reply-To: <20201123152146.GE11033@willie-the-truck>
References: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <20201123152146.GE11033@willie-the-truck>
Message-ID: <50b68f2bdf9413b896fbe816ba4ddbc9@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: Robin Murphy <robin.murphy@arm.com>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, "Kristian H .
 Kristensen" <hoegsberg@google.com>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
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

On 2020-11-23 20:51, Will Deacon wrote:
> On Tue, Nov 17, 2020 at 08:00:39PM +0530, Sai Prakash Ranjan wrote:
>> Some hardware variants contain a system cache or the last level
>> cache(llc). This cache is typically a large block which is shared
>> by multiple clients on the SOC. GPU uses the system cache to cache
>> both the GPU data buffers(like textures) as well the SMMU pagetables.
>> This helps with improved render performance as well as lower power
>> consumption by reducing the bus traffic to the system memory.
>> 
>> The system cache architecture allows the cache to be split into slices
>> which then be used by multiple SOC clients. This patch series is an
>> effort to enable and use two of those slices preallocated for the GPU,
>> one for the GPU data buffers and another for the GPU SMMU hardware
>> pagetables.
>> 
>> Patch 1 - Patch 6 adds system cache support in SMMU and GPU driver.
>> Patch 7 and 8 are minor cleanups for arm-smmu impl.
>> 
>> Changes in v8:
>>  * Introduce a generic domain attribute for pagetable config (Will)
>>  * Rename quirk to more generic IO_PGTABLE_QUIRK_ARM_OUTER_WBWA (Will)
>>  * Move non-strict mode to use new struct domain_attr_io_pgtbl_config 
>> (Will)
> 
> Modulo some minor comments I've made, this looks good to me. What is 
> the
> plan for merging it? I can take the IOMMU parts, but patches 4-6 touch 
> the
> MSM GPU driver and I'd like to avoid conflicts with that.
> 

SMMU bits are pretty much independent and GPU relies on the domain 
attribute
and the quirk exposed, so as long as SMMU changes go in first it should 
be good.
Rob?

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
