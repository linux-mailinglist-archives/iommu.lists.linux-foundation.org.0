Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DAE19643B
	for <lists.iommu@lfdr.de>; Sat, 28 Mar 2020 08:35:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DEFD68758F;
	Sat, 28 Mar 2020 07:35:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BNYflAqBsK1a; Sat, 28 Mar 2020 07:35:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DDAC987569;
	Sat, 28 Mar 2020 07:35:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C277AC0177;
	Sat, 28 Mar 2020 07:35:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 145D0C0177
 for <iommu@lists.linux-foundation.org>; Sat, 28 Mar 2020 07:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0BB0F87561
 for <iommu@lists.linux-foundation.org>; Sat, 28 Mar 2020 07:35:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C7GBr60K7XY8 for <iommu@lists.linux-foundation.org>;
 Sat, 28 Mar 2020 07:35:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 126C78755D
 for <iommu@lists.linux-foundation.org>; Sat, 28 Mar 2020 07:35:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585380920; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=dK8y/HKe+m96WTHnDDWEvdDioyHshCf4t/zZiVGk6X0=;
 b=XzItlLL5sHRkY3dAz2tJeHJhtSBt22K8BNb96LYMZuyRl1VOwtzGZcVcqPfmcWKw4UCacdM/
 h1nPBp4xP/nkLpsoCuXA/kDepIqYXWfYPiTBGXIauNw0iBanxaNQKDwzj2aQrHBdEUTkxuVW
 ZiSbvuZTZmqVR/1esz/s2ATCAeE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7efe36.7f0097b6df48-smtp-out-n03;
 Sat, 28 Mar 2020 07:35:18 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A6369C433F2; Sat, 28 Mar 2020 07:35:18 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E5E48C433D2;
 Sat, 28 Mar 2020 07:35:17 +0000 (UTC)
MIME-Version: 1.0
Date: Sat, 28 Mar 2020 13:05:17 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/arm-smmu: Demote error messages to debug in
 shutdown callback
In-Reply-To: <5858bdac-b7f9-ac26-0c0d-c9653cef841d@arm.com>
References: <20200327132852.10352-1-saiprakash.ranjan@codeaurora.org>
 <0023bc68-45fb-4e80-00c8-01fd0369243f@arm.com>
 <37db9a4d524aa4d7529ae47a8065c9e0@codeaurora.org>
 <5858bdac-b7f9-ac26-0c0d-c9653cef841d@arm.com>
Message-ID: <d60196b548e1241b8334fadd0e8c2fb5@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>
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

Hi Robin,

On 2020-03-28 00:32, Robin Murphy wrote:
> On 2020-03-27 3:09 pm, Sai Prakash Ranjan wrote:
> 
> Imagine your network driver doesn't implement a .shutdown method (so
> the hardware is still active regardless of device links), happens to
> have an Rx buffer or descriptor ring DMA-mapped at an IOVA that looks
> like the physical address of the memory containing some part of the
> kernel text lower down that call stack, and the MAC receives a
> broadcast IP packet at about the point arm_smmu_device_shutdown() is
> returning. Enjoy debugging that ;)
> 
> And if coincidental memory corruption seems too far-fetched for your
> liking, other fun alternatives might include "display tries to scan
> out from powered-off device, deadlocks interconnect and prevents
> anything else making progress", or "access to TZC-protected physical
> address triggers interrupt and over-eager Secure firmware resets
> system before orderly poweroff has a chance to finish".
> 
> Of course the fact that in practice we'll *always* see the warning
> because there's no way to tear down the default DMA domains, and even
> if all devices *have* been nicely quiesced there's no way to tell, is
> certainly less than ideal. Like I say, it's not entirely clear-cut
> either way...
> 

Thanks for these examples, good to know these scenarios in case we come 
across these.
However, if we see these error/warning messages appear everytime then 
what will be
the credibility of these messages? We will just ignore these messages 
when
these issues you mention actually appears because we see them everytime 
on
reboot or shutdown. So doesn't it make sense to enable these only when
we are debugging? We could argue that how will we know the issue could 
be related
to SMMU, but that's the case even now.

The reason why this came up was that, we had a NOC(interconnect) error 
which does
have a logging atleast in QCOM platforms from the secure side(it prints 
these on the console)
after the SMMU err messages and there was a confusion if it was related 
to these messages.
However, NOC error messages did identify the issue with the USB and it 
was solved later.
So these SMMU err/warning messages could be misleading like the above 
case almost everytime.

The probability of the issues you mentioned occuring is very less than 
the actual reboot,
shutdown scenarios, for ex: we run reboot stress test for thousands of 
times and these messages
don't add anything special in those cases when any issue occurs because 
they are seen
everytime.

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
