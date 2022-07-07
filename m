Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0F0569A61
	for <lists.iommu@lfdr.de>; Thu,  7 Jul 2022 08:20:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3AC6610EC;
	Thu,  7 Jul 2022 06:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3AC6610EC
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=VgxSiUZo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id feiNfBoCIxKw; Thu,  7 Jul 2022 06:20:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BD408610CD;
	Thu,  7 Jul 2022 06:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD408610CD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8661EC0077;
	Thu,  7 Jul 2022 06:20:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ABFF9C002D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 06:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 861C040A6E
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 06:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 861C040A6E
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.a=rsa-sha256 header.s=qcdkim header.b=VgxSiUZo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eB8cTgNaNohu for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 06:20:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83A2B40190
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83A2B40190
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 06:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657174824; x=1688710824;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0GncP1lP/UKCHyowwfddoOYDjFybJCdgKqH6YR5zIuI=;
 b=VgxSiUZonEeZyi+nSP5JQP+1T7RNkUIMm8lYLEMpPo/O1vRktLB55Qkr
 fAEBpod48laeNH1OoQqqGpCkt6jIY3lg/bjli3oxG+XAPa7Ey9mvVw6n5
 5/9HxEl2lRqNoJTGkgQPvnB4HBnT64DwMRMM9zRm1CEtOgDYyCWVH08LG U=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 06 Jul 2022 23:20:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 23:20:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 6 Jul 2022 23:20:21 -0700
Received: from [10.50.36.54] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 6 Jul 2022
 23:20:18 -0700
Message-ID: <32306c0d-58cf-b1df-2794-5b1f17e3d062@quicinc.com>
Date: Thu, 7 Jul 2022 11:50:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCHv2] iommu/arm-smmu-qcom: Add debug support for TLB sync
 timeouts
Content-Language: en-US
To: Will Deacon <will@kernel.org>
References: <20220526041403.9984-1-quic_saipraka@quicinc.com>
 <20220706115638.GD2403@willie-the-truck>
From: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
In-Reply-To: <20220706115638.GD2403@willie-the-truck>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 quic_guptap@quicinc.com, Robin Murphy <robin.murphy@arm.com>,
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

On 7/6/2022 5:26 PM, Will Deacon wrote:
> On Thu, May 26, 2022 at 09:44:03AM +0530, Sai Prakash Ranjan wrote:
>> TLB sync timeouts can be due to various reasons such as TBU power down
>> or pending TCU/TBU invalidation/sync and so on. Debugging these often
>> require dumping of some implementation defined registers to know the
>> status of TBU/TCU operations and some of these registers are not
>> accessible in non-secure world such as from kernel and requires SMC
>> calls to read them in the secure world. So, add this debug support
>> to dump implementation defined registers for TLB sync timeout issues.
>>
>> Signed-off-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
>> ---
>>
>> Changes in v2:
>>   * Use scm call consistently so that it works on older chipsets where
>>     some of these regs are secure registers.
>>   * Add device specific data to get the implementation defined register
>>     offsets.
>>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 161 ++++++++++++++++++---
>>   drivers/iommu/arm/arm-smmu/arm-smmu.c      |   2 +
>>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |   1 +
>>   3 files changed, 146 insertions(+), 18 deletions(-)
> If this is useful to you, then I suppose it's something we could support,
> however I'm pretty worried about our ability to maintain/scale this stuff
> as it is extended to support additional SoCs and other custom debugging
> features.
>
> Perhaps you could stick it all in arm-smmu-qcom-debug.c and have a new
> config option for that, so at least it's even further out of the way?
>
> Will

Sounds good to me, will do that.

Thanks,
Sai
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
