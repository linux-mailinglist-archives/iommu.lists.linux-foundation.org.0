Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B90A39F6CD
	for <lists.iommu@lfdr.de>; Tue,  8 Jun 2021 14:33:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03BA56FC06;
	Tue,  8 Jun 2021 12:33:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WnACv2D0ZC3x; Tue,  8 Jun 2021 12:33:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2545A6FC07;
	Tue,  8 Jun 2021 12:33:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED028C0001;
	Tue,  8 Jun 2021 12:33:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62F77C0001
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 12:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id 3B715402B5
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 12:33:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id BKafxjerBifx for <iommu@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 12:33:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id E3736400C8
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 12:33:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623155592; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=rqM3fUXUMOHAbavoHfTY6h2xEOV5jKG4BPoa4nABeLE=;
 b=tr0MxEpFubNiP2/iHoZ7nCkrtdh7dFzGpQ/o5XoA9k84IcF1RQT6pknNjdJlCc+2nGGi/V1I
 ZfPI3eBJ5229wECjsyGmNWidbr1eZrskMrvy2DNjnnov9+qV3BEsWnpgKPW/P9AxBHR+unAc
 +Dgymy8fgFYneSzBCKE6nzKQPIE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60bf6377ed59bf69ccbfdc2c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 08 Jun 2021 12:32:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 06404C4338A; Tue,  8 Jun 2021 12:32:55 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 37632C433F1;
 Tue,  8 Jun 2021 12:32:54 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 08 Jun 2021 18:02:54 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCHv3 0/2] iommu/arm-smmu-qcom: Add SC7280 support
In-Reply-To: <20210608120115.GA10174@willie-the-truck>
References: <cover.1618898456.git.saiprakash.ranjan@codeaurora.org>
 <20210608120115.GA10174@willie-the-truck>
Message-ID: <24b5ab1c287e86f195a34e6a780d5505@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

On 2021-06-08 17:31, Will Deacon wrote:
> On Tue, Apr 20, 2021 at 11:34:55AM +0530, Sai Prakash Ranjan wrote:
>> Patch 1 adds the sc7280 smmu compatible.
>> Patch 2 moves the adreno smmu check before apss smmu to enable
>> adreno smmu specific implementation.
>> 
>> Note that dt-binding for sc7280 is already merged.
> 
> This conflicts with what I've already got queued at [1]. Please can you
> send an updated version, as I wasn't sure about the initialisation 
> order
> you need here wrt to the ACPI parts.
> 
> Thanks,
> 
> Will
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/arm-smmu/updates

Sure, have rebased and sent the updated patch [1] after testing for the 
order.

Thanks,
Sai

[1] 
https://lore.kernel.org/lkml/cover.1623155117.git.saiprakash.ranjan@codeaurora.org/

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
