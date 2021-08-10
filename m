Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE7D3DDD5C
	for <lists.iommu@lfdr.de>; Mon,  2 Aug 2021 18:17:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2CC3400EF;
	Mon,  2 Aug 2021 16:17:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VMJnq_44EWb6; Mon,  2 Aug 2021 16:17:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C983840180;
	Mon,  2 Aug 2021 16:17:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87450C0022;
	Mon,  2 Aug 2021 16:17:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8FB53C000E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 16:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D43F607B7
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 16:16:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eOHpZcwbmc44 for <iommu@lists.linux-foundation.org>;
 Mon,  2 Aug 2021 16:16:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id B877F6063C
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 16:16:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D8D111D4;
 Mon,  2 Aug 2021 09:16:57 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE1363F66F;
 Mon,  2 Aug 2021 09:16:53 -0700 (PDT)
Subject: Re: [PATCH v4 5/6] iova: Add iova_len argument to init_iova_domain()
To: John Garry <john.garry@huawei.com>, Will Deacon <will@kernel.org>
References: <1626259003-201303-1-git-send-email-john.garry@huawei.com>
 <1626259003-201303-6-git-send-email-john.garry@huawei.com>
 <20210802150644.GD28735@willie-the-truck>
 <c6be0b9f-531b-dc12-2747-3acbecfcd531@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <1d06eda1-9961-d023-f5e7-fe87e768f067@arm.com>
Date: Mon, 2 Aug 2021 17:16:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <c6be0b9f-531b-dc12-2747-3acbecfcd531@huawei.com>
Content-Language: en-GB
Cc: linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com, mst@redhat.com,
 airlied@linux.ie, gregkh@linuxfoundation.org, linuxarm@huawei.com,
 jonathanh@nvidia.com, iommu@lists.linux-foundation.org,
 thierry.reding@gmail.com, daniel@ffwll.ch, bingbu.cao@intel.com,
 digetx@gmail.com, mchehab@kernel.org, jasowang@redhat.com,
 tian.shu.qiu@intel.com
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

On 2021-08-02 17:06, John Garry wrote:
> On 02/08/2021 16:06, Will Deacon wrote:
>> On Wed, Jul 14, 2021 at 06:36:42PM +0800, John Garry wrote:
>>> Add max opt argument to init_iova_domain(), and use it to set the 
>>> rcaches
>>> range.
>>>
>>> Also fix up all users to set this value (at 0, meaning use default).
>> Wrap that in init_iova_domain_defaults() to avoid the mysterious 0?
> 
> Sure, I can do something like that. I actually did have separate along 
> those lines in v3 before I decided to change it.

Y'know, at this point I'm now starting to seriously wonder whether 
moving the rcaches into iommu_dma_cookie wouldn't make a whole lot of 
things simpler... :/

Does that sound like crazy talk to you, or an idea worth entertaining?

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
