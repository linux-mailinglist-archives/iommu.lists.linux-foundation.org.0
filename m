Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A340162E99
	for <lists.iommu@lfdr.de>; Tue, 18 Feb 2020 19:31:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 15F76862E8;
	Tue, 18 Feb 2020 18:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id quZUkWCY+qkT; Tue, 18 Feb 2020 18:31:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EBDA4853E6;
	Tue, 18 Feb 2020 18:31:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0D3FC1D8E;
	Tue, 18 Feb 2020 18:31:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE2F1C013E
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 18:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D2067853E6
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 18:31:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r1P9fRkFCHEb for <iommu@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 18:31:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id 24819820C9
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 18:31:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 843CF31B;
 Tue, 18 Feb 2020 10:31:54 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98D963F68F;
 Tue, 18 Feb 2020 10:31:52 -0800 (PST)
Subject: Re: drivers/iommu/qcom_iommu.c:348 qcom_iommu_domain_free+0x5c/0x70
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>
References: <CA+G9fYtScOpkLvx=__gP903uJ2v87RwZgkAuL6RpF9_DTDs9Zw@mail.gmail.com>
 <20200218182359.GC2635524@kroah.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <19d57dfd-12df-9237-3576-32b0feef90fa@arm.com>
Date: Tue, 18 Feb 2020 18:31:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200218182359.GC2635524@kroah.com>
Content-Language: en-GB
Cc: Sasha Levin <sashal@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 lkft-triage@lists.linaro.org, bjorn.andersson@linaro.org,
 iommu@lists.linux-foundation.org, linux- stable <stable@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 Will Deacon <will@kernel.org>, masneyb@onstation.org
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

On 18/02/2020 6:23 pm, Greg Kroah-Hartman wrote:
[...]
> Can you bisect to find the offending commit?

This particular presentation appears to be down to the DRM driver 
starting to call of_platform_depopulate(), but it's merely exposing 
badness in the IOMMU driver that's been there from day 1. I just sent a 
fix for that[1].

Robin.

[1] 
https://lore.kernel.org/linux-iommu/be92829c6e5467634b109add002351e6cf9e18d2.1582049382.git.robin.murphy@arm.com/
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
