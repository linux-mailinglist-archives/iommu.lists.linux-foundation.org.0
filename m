Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BB99F1C865C
	for <lists.iommu@lfdr.de>; Thu,  7 May 2020 12:04:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B205826291;
	Thu,  7 May 2020 10:04:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HcpLJaCQ-+5z; Thu,  7 May 2020 10:04:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9B75726261;
	Thu,  7 May 2020 10:04:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86468C0890;
	Thu,  7 May 2020 10:04:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ADD32C07FF
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 10:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8D76526129
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 10:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MEatUCNYfEwR for <iommu@lists.linux-foundation.org>;
 Thu,  7 May 2020 10:04:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by silver.osuosl.org (Postfix) with ESMTPS id 16D5E255A6
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 10:04:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1588845876; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=1GMwknV/Hnx3pGwGQw2fgiF5fV1yZjKvADEF8GPIB3k=;
 b=k2IjBBr/6MC9GYR0jjNBA2ccRMNcpqbn2i3aixB+Qv6q1F2mt1tDz0o05U07TvnryfiA8WvM
 bEEpF7I86ZyVQUKkafNJUeUfM1EpikB73Lpk/r3diZGYmcBRSKbBLQJMD/C83F6r3Dv+HJBh
 FTNiuUVN9epm17/fp9TxsZglfm4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb3dd20.7f97846ceea0-smtp-out-n01;
 Thu, 07 May 2020 10:04:16 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 37FE1C4478C; Thu,  7 May 2020 10:04:16 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 81A1BC433F2;
 Thu,  7 May 2020 10:04:15 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 07 May 2020 15:34:15 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Doug Anderson <dianders@chromium.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCHv2] iommu/arm-smmu: Make remove callback message more
 informative
In-Reply-To: <CAD=FV=U0Hhae3D1-P8kbcZafHeuqng11BNAbOb2YWPx+M7X5Gw@mail.gmail.com>
References: <20200423095531.9868-1-saiprakash.ranjan@codeaurora.org>
 <CAD=FV=W=d=KrTwgMOO-ukFc7ZhkE92qGYumUEDrtjmhQOpdWbg@mail.gmail.com>
 <CAD=FV=U0Hhae3D1-P8kbcZafHeuqng11BNAbOb2YWPx+M7X5Gw@mail.gmail.com>
Message-ID: <0b5098c28360d018f390a97155b9776c@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, "list@263.net:IOMMU DRIVERS ,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
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

Hi,

On 2020-05-07 05:40, Doug Anderson wrote:
> Hi,
> 
> On Thu, Apr 23, 2020 at 7:35 AM Doug Anderson <dianders@chromium.org> 
> wrote:
>> 
>> Hi,
>> 
>> On Thu, Apr 23, 2020 at 2:55 AM Sai Prakash Ranjan
>> <saiprakash.ranjan@codeaurora.org> wrote:
>> >
>> > Currently on reboot/shutdown, the following messages are
>> > displayed on the console as error messages before the
>> > system reboots/shutdown as part of remove callback.
>> >
>> > On SC7180:
>> >
>> >   arm-smmu 15000000.iommu: removing device with active domains!
>> >   arm-smmu 5040000.iommu: removing device with active domains!
>> >
>> > Make this error message more informative and less scary.
>> >
>> > Reported-by: Douglas Anderson <dianders@chromium.org>
>> > Suggested-by: Robin Murphy <robin.murphy@arm.com>
>> > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> > ---
>> >  drivers/iommu/arm-smmu.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> Is this patch waiting on anything in particular now?  Do we need
> reviews from Robin and/or Will?
> 

Waiting for their reviews as they are the maintainers/reviewers :)

-Sai
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
