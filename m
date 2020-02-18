Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B8F162EEA
	for <lists.iommu@lfdr.de>; Tue, 18 Feb 2020 19:44:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 36B4E86229;
	Tue, 18 Feb 2020 18:44:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Gs4OOwfyxRA; Tue, 18 Feb 2020 18:44:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 34C6D8621D;
	Tue, 18 Feb 2020 18:44:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2209CC013E;
	Tue, 18 Feb 2020 18:44:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 581D6C013E
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 18:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4601B204C1
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 18:43:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6GQfyBh9BH6M for <iommu@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 18:43:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id AF00F20027
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 18:43:57 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B49D21D56;
 Tue, 18 Feb 2020 18:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582051437;
 bh=aTM86BoyrTwzruHENYmelIh0HzLGd9t+clXn5N5NwmU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aeSF1kbpSuMsqrTZUpJzF+HqiFCrZm5kUT9u57IYv1q39pXmT+2BrqVI2hf5DKLXA
 epCfw1GrXEu6qEY5A5zKMtJbwO7H29wZ9a8h3Kls71uSiVYmpwc6GbGjJMXnQRfjij
 35R+hM6tCfRbjenUY/talvCHn83IQagI4rKaIhpM=
Date: Tue, 18 Feb 2020 19:43:55 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: drivers/iommu/qcom_iommu.c:348 qcom_iommu_domain_free+0x5c/0x70
Message-ID: <20200218184355.GA2667975@kroah.com>
References: <CA+G9fYtScOpkLvx=__gP903uJ2v87RwZgkAuL6RpF9_DTDs9Zw@mail.gmail.com>
 <20200218182359.GC2635524@kroah.com>
 <19d57dfd-12df-9237-3576-32b0feef90fa@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <19d57dfd-12df-9237-3576-32b0feef90fa@arm.com>
Cc: Sasha Levin <sashal@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, iommu@lists.linux-foundation.org,
 lkft-triage@lists.linaro.org, bjorn.andersson@linaro.org,
 linux- stable <stable@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>, Will Deacon <will@kernel.org>,
 masneyb@onstation.org
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

On Tue, Feb 18, 2020 at 06:31:51PM +0000, Robin Murphy wrote:
> On 18/02/2020 6:23 pm, Greg Kroah-Hartman wrote:
> [...]
> > Can you bisect to find the offending commit?
> 
> This particular presentation appears to be down to the DRM driver starting
> to call of_platform_depopulate(), but it's merely exposing badness in the
> IOMMU driver that's been there from day 1. I just sent a fix for that[1].
> 
> Robin.
> 
> [1] https://lore.kernel.org/linux-iommu/be92829c6e5467634b109add002351e6cf9e18d2.1582049382.git.robin.murphy@arm.com/

Can you also add a cc: stable tag to it so that I know to pick it up?

thanks,

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
