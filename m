Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E6239A082
	for <lists.iommu@lfdr.de>; Thu,  3 Jun 2021 14:06:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BC38400EE;
	Thu,  3 Jun 2021 12:06:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kfZqyPpo8NWi; Thu,  3 Jun 2021 12:05:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B888400EB;
	Thu,  3 Jun 2021 12:05:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2B63C0024;
	Thu,  3 Jun 2021 12:05:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99A71C0001
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 12:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9508F400CA
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 12:05:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8qy8Mvz3VpbX for <iommu@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 12:05:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD225400A7
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 12:05:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB6A21063;
 Thu,  3 Jun 2021 05:05:50 -0700 (PDT)
Received: from [10.57.73.64] (unknown [10.57.73.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4AE23F774;
 Thu,  3 Jun 2021 05:05:49 -0700 (PDT)
Subject: Re: Different type iommus integrated in a SoC
To: "xxm@rock-chips.com" <xxm@rock-chips.com>, hch <hch@lst.de>,
 joro <joro@8bytes.org>, will <will@kernel.org>
References: <2021052710373173260118@rock-chips.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <5d7127d5-b73c-2002-1734-98aab2295c8e@arm.com>
Date: Thu, 3 Jun 2021 13:05:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <2021052710373173260118@rock-chips.com>
Content-Language: en-GB
Cc: linux-rockchip <linux-rockchip@lists.infradead.org>,
 iommu <iommu@lists.linux-foundation.org>
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

On 2021-05-27 03:37, xxm@rock-chips.com wrote:
> Hi all,
> 
> I have a SoC integrate with two different types of iommus, one is ARM SMMU, serves the PCIe/SATA/USB,
> the others are vendor specific iommus, serves display device and multimedia device.
> 
> In the current linux kernel, the iommu framework seems only support one type iommu at runtime, if enable both types iommu, only one type can work.
> Is there any way to support this kind of SoC?

Hooray! I've been forecasting this for years, but the cases we regularly 
hit with internal FPGA prototyping (nor the secret unused MMU-400 I 
found on RK3288) have never really been a strong enough argument to 
stand behind.

Based on what I remember from looking into this a few years ago, 
converting *most* of the API to per-device ops (now via dev->iommu) is 
trivial; the main challenge will be getting the per-device data 
bootstrapped in iommu_probe_device(), which would probably need to rely 
on the fwspec and/or list of registered IOMMU instances.

The other notable thing which will need to change is the domain 
allocation interface, but in practice I think everyone who calls 
iommu_domain_alloc() today is in fact doing so for a specific device, so 
I don't think it's as big a problem as it might first appear.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
