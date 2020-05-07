Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF731C8D7A
	for <lists.iommu@lfdr.de>; Thu,  7 May 2020 16:05:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 145C1263F9;
	Thu,  7 May 2020 14:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lcccFYnNZriQ; Thu,  7 May 2020 14:05:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0C99E263F5;
	Thu,  7 May 2020 14:05:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7750C07FF;
	Thu,  7 May 2020 14:05:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE4AEC07FF
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 14:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9C6D68855B
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 14:05:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id suCvx0ecetIe for <iommu@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:05:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 80711884C2
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 14:05:06 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8BD282084D;
 Thu,  7 May 2020 14:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588860306;
 bh=SiwCH8RCKfzXT3qqrhJZK6OicpexUtZYquQREUsumG0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AvO/xVWP7PR6qhNwWQTmOuJP+VmmvTjbcv7/q8WBox/SvGGpjlLs0ZpZWiMQQqE8k
 07XEMskdNPbV4W/3A3Sd8DKXulryXo/P7jizjir6hH/A3wgkZ1oTWAuapQYbWI+5An
 RgrPeC32TR1T/YvGhq3ltgPztLpwbdSfcFH4UqHk=
From: Will Deacon <will@kernel.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCHv2] iommu/arm-smmu: Make remove callback message more
 informative
Date: Thu,  7 May 2020 15:04:54 +0100
Message-Id: <158885763013.86999.17864741879925126551.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200423095531.9868-1-saiprakash.ranjan@codeaurora.org>
References: <20200423095531.9868-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Cc: catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On Thu, 23 Apr 2020 15:25:31 +0530, Sai Prakash Ranjan wrote:
> Currently on reboot/shutdown, the following messages are
> displayed on the console as error messages before the
> system reboots/shutdown as part of remove callback.
> 
> On SC7180:
> 
>   arm-smmu 15000000.iommu: removing device with active domains!
>   arm-smmu 5040000.iommu: removing device with active domains!
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu: Make remove callback message more informative
      https://git.kernel.org/will/c/02782f3d60f1

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
