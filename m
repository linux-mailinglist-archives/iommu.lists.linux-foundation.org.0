Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD653639A1
	for <lists.iommu@lfdr.de>; Mon, 19 Apr 2021 05:11:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 627A2834F6;
	Mon, 19 Apr 2021 03:11:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pEsJBm5sTiwq; Mon, 19 Apr 2021 03:11:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C9EB83542;
	Mon, 19 Apr 2021 03:11:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52CDBC001B;
	Mon, 19 Apr 2021 03:11:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5AB23C000B
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 03:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id 3C5C740132
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 03:11:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id QaDl-4UPElx8 for <iommu@lists.linux-foundation.org>;
 Mon, 19 Apr 2021 03:11:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id 51B9B400C0
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 03:11:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1618801892; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Ym5p8FkKGFp0PUrH5hq1AtaHT8k5PkOb5eh8el/aH/k=;
 b=sPQSyPYReLUdgTVXr1aMKeiBOc82MI3B943M4usgX6l/S6lcyO8rvDWd25uL52zESFfGzgZn
 dA+66wM5wJdL6F4CnnPlcq0LMbt42kPeWAHRYTtQ+ZrwEsLEoDNvk9wKQAs9FWDw9rMhjApa
 f1KuA+rFF/RsVP+RhLXBjYjdQC8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 607cf4e3a817abd39a1b925a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 19 Apr 2021 03:11:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8931FC4323A; Mon, 19 Apr 2021 03:11:30 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 13C79C433D3;
 Mon, 19 Apr 2021 03:11:29 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 19 Apr 2021 08:41:29 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCHv2 2/2] iommu/arm-smmu-qcom: Move the adreno smmu specific
 impl earlier
In-Reply-To: <118ced3153cd7fa5e8c16e5f0e2d5d19@codeaurora.org>
References: <YDlIrjkfv16o4Nu3@builder.lan>
 <20210227135321.420-1-saiprakash.ranjan@codeaurora.org>
 <YEqn1SjsGgK0V8K4@builder.lan>
 <8cfaed1915ad6dd0c34ac7eb2391b410@codeaurora.org>
 <727fa9fe2e644f88ba35c2877d71788e@codeaurora.org>
 <20210325150506.GD15172@willie-the-truck>
 <118ced3153cd7fa5e8c16e5f0e2d5d19@codeaurora.org>
Message-ID: <daaa67d41f2760945ed3bf6ced11891f@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 jcrouse@codeaurora.org, akhilpo@codeaurora.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com,
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

On 2021-04-05 14:12, Sai Prakash Ranjan wrote:
> Hi Bjorn,
> 
> On 2021-03-25 20:35, Will Deacon wrote:
>> On Thu, Mar 25, 2021 at 01:10:12PM +0530, Sai Prakash Ranjan wrote:
> 
> <snip>...
> 
>>> 
>>> I think there is consensus on this series. I can resend if required 
>>> but it
>>> still applies cleanly, let me know if you have any comments?
>> 
>> Please resend with the bindings patch, and I'd like Bjorn's Ack as 
>> well.
>> 
> 
> Can we have your review/ack in case there is nothing pending here?
> 

Gentle Ping!

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
