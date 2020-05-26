Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 945C019C1F2
	for <lists.iommu@lfdr.de>; Thu,  2 Apr 2020 15:20:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 497CD888EE;
	Thu,  2 Apr 2020 13:20:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0RCzeF+FpGsH; Thu,  2 Apr 2020 13:20:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D8375888F6;
	Thu,  2 Apr 2020 13:20:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BFF4AC07FF;
	Thu,  2 Apr 2020 13:20:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9EF60C07FF
 for <iommu@lists.linux-foundation.org>; Thu,  2 Apr 2020 13:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 88D0586208
 for <iommu@lists.linux-foundation.org>; Thu,  2 Apr 2020 13:20:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BeTAzV1aLCTn for <iommu@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 13:20:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8F78C859F4
 for <iommu@lists.linux-foundation.org>; Thu,  2 Apr 2020 13:20:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3B2630E;
 Thu,  2 Apr 2020 06:20:09 -0700 (PDT)
Received: from [10.57.59.199] (unknown [10.57.59.199])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B33B83F52E;
 Thu,  2 Apr 2020 06:20:08 -0700 (PDT)
Subject: Re: How to fix WARN from drivers/base/dd.c in next-20200401 if
 CONFIG_MODULES=y?
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "john.stultz@linaro.org" <john.stultz@linaro.org>
References: <TYAPR01MB45443DF63B9EF29054F7C41FD8C60@TYAPR01MB4544.jpnprd01.prod.outlook.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <b0dea497-b272-e74a-ac9c-3a3cd653a9f9@arm.com>
Date: Thu, 2 Apr 2020 14:20:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <TYAPR01MB45443DF63B9EF29054F7C41FD8C60@TYAPR01MB4544.jpnprd01.prod.outlook.com>
Content-Language: en-GB
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, "rafael@kernel.org" <rafael@kernel.org>
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

On 2020-04-02 11:16 am, Yoshihiro Shimoda wrote:
> Hi John,
> 
> I found an issue after applied the following patches:
> ---
> 64c775f driver core: Rename deferred_probe_timeout and make it global
> 0e9f8d0 driver core: Remove driver_deferred_probe_check_state_continue()
> bec6c0e pinctrl: Remove use of driver_deferred_probe_check_state_continue()
> e2cec7d driver core: Set deferred_probe_timeout to a longer default if CONFIG_MODULES is set
> c8c43ce driver core: Fix driver_deferred_probe_check_state() logic
> ---
> 
> Before these patches, on my environment [1], some device drivers
> which has iommus property output the following message when probing:
> 
> [    3.222205] ravb e6800000.ethernet: ignoring dependency for device, assuming no driver
> [    3.257174] ravb e6800000.ethernet eth0: Base address at 0xe6800000, 2e:09:0a:02:eb:2d, IRQ 117.
> 
> So, since ravb driver is probed within 4 seconds, we can use NFS rootfs correctly.
> 
> However, after these patches are applied, since the patches are always waiting for 30 seconds
> for of_iommu_configure() when IOMMU hardware is disabled, drivers/base/dd.c output WARN.
> Also, since ravb cannot be probed for 30 seconds, we cannot use NFS rootfs anymore.
> JFYI, I copied the kernel log to the end of this email.
> 
> I guess the patches will be merged into v5.7-rc1 because the patches are contained from
> next-20200316, I'd like to fix the issue in v5.7-rcN cycle somehow.

This already came up in a different context, and there's a proposal from 
John here:

https://lore.kernel.org/lkml/20200330202715.86609-1-john.stultz@linaro.org/

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
