Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A66D182FD0
	for <lists.iommu@lfdr.de>; Thu, 12 Mar 2020 13:05:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1511226713;
	Thu, 12 Mar 2020 12:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 601QphZMK2VY; Thu, 12 Mar 2020 12:04:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 534BD2663D;
	Thu, 12 Mar 2020 12:04:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 423DBC0177;
	Thu, 12 Mar 2020 12:04:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CEAEC0177
 for <iommu@lists.linux-foundation.org>; Thu, 12 Mar 2020 12:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 87C9589493
 for <iommu@lists.linux-foundation.org>; Thu, 12 Mar 2020 12:04:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1WNIgZIa7Gvr for <iommu@lists.linux-foundation.org>;
 Thu, 12 Mar 2020 12:04:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9B1D789170
 for <iommu@lists.linux-foundation.org>; Thu, 12 Mar 2020 12:04:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDDB231B;
 Thu, 12 Mar 2020 05:04:56 -0700 (PDT)
Received: from [192.168.1.123] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25B963F67D;
 Thu, 12 Mar 2020 05:04:55 -0700 (PDT)
Subject: Re: [PATCH 0/3] Request direct mapping for modem firmware subdevice
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
References: <20200309182255.20142-1-sibis@codeaurora.org>
 <20200310112332.GG3794@8bytes.org>
 <4ed6ddd667a3e6f670084a443d141474@codeaurora.org>
 <20200310162320.GL3794@8bytes.org>
 <a50040a9-54fe-f682-dd7e-b2991b48d633@arm.com>
 <ff805c5c647326c5edaddf2efec5cb87@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <497e40b8-300f-1b83-4312-93a58c459d1d@arm.com>
Date: Thu, 12 Mar 2020 12:05:00 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ff805c5c647326c5edaddf2efec5cb87@codeaurora.org>
Content-Language: en-GB
Cc: ohad@wizery.com, devicetree@vger.kernel.org,
 linux-kernel-owner@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 agross@kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org,
 Sibi Sankar <sibis@codeaurora.org>
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

On 2020-03-12 6:28 am, Sai Prakash Ranjan wrote:
> Hi Robin,
> 
> On 2020-03-10 22:14, Robin Murphy wrote:
>> On 10/03/2020 4:23 pm, Joerg Roedel wrote:
>>> On Tue, Mar 10, 2020 at 07:30:50PM +0530, Sibi Sankar wrote:
>>>> The accesses are initiated by the firmware
>>>> and they access modem reserved regions.
>>>> However as explained in ^^ any accesses
>>>> outside the region will result in a violation
>>>> and is controlled through XPUs (protection units).
>>>
>>> Okay, this sounds like a case for arm_smmu_get_resv_region(). It should
>>> return an entry for the reserved memory region the firmware needs to
>>> access, so that generic iommu can setup this mapping.
>>>
>>> Note that it should return that entry only for your device, not for all
>>> devices. Maybe there is a property in DT or IORT you can set to
>>> transport this information into the arm-smmu driver.
>>>
>>> This is pretty similar to RMRR mapping on the Intel VT-d IOMMU or
>>> Unity-mapped ranges in the AMD-Vi IOMMU.
>>
>> Yup, a way to describe boot-time memory regions in IORT is in the
>> process of being specced out; the first attempt at an equivalent for
>> DT is here:
>>
>> https://lore.kernel.org/linux-iommu/20191209150748.2471814-1-thierry.reding@gmail.com/ 
>>
>>
>> If that's not enough and the SMMU still needs to treat certain Stream
>> IDs specially because they may be untranslatable (due to having direct
>> access to memory as a side-channel), then that should be handled in
>> the SoC-specific corner of the SMMU driver, not delegated to
>> individual endpoint drivers.
>>
> 
> Are you talking about this one for SoC specific change - 
> https://lore.kernel.org/patchwork/patch/1183530/

Exactly - this particular wheel needs no reinventing at all.

[ I guess I should go review those patches properly... :) ]

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
