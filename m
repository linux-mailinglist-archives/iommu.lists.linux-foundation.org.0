Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 275D43DDCAB
	for <lists.iommu@lfdr.de>; Mon,  2 Aug 2021 17:46:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B46B400A4;
	Mon,  2 Aug 2021 15:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_o17heu3aBz; Mon,  2 Aug 2021 15:46:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5071F40112;
	Mon,  2 Aug 2021 15:46:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3208FC0022;
	Mon,  2 Aug 2021 15:46:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A255C000E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 15:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CD90607D0
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 15:46:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0QGowMV7CroJ for <iommu@lists.linux-foundation.org>;
 Mon,  2 Aug 2021 15:46:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0A8E60642
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 15:46:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0119311D4;
 Mon,  2 Aug 2021 08:46:45 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 074273F66F;
 Mon,  2 Aug 2021 08:46:43 -0700 (PDT)
Subject: Re: [Patch V2 0/2] iommu/arm-smmu: Fix races in iommu domain/group
 creation
To: Will Deacon <will@kernel.org>, Ashish Mhetre <amhetre@nvidia.com>
References: <1623961837-12540-1-git-send-email-amhetre@nvidia.com>
 <20210802151607.GF28735@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <9c38c53c-c145-097a-4c7e-40f1c06a1f01@arm.com>
Date: Mon, 2 Aug 2021 16:46:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210802151607.GF28735@willie-the-truck>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

On 2021-08-02 16:16, Will Deacon wrote:
> On Fri, Jun 18, 2021 at 02:00:35AM +0530, Ashish Mhetre wrote:
>> Multiple iommu domains and iommu groups are getting created for the devices
>> sharing same SID. It is expected for devices sharing same SID to be in same
>> iommu group and same iommu domain.
>> This is leading to context faults when one device is accessing IOVA from
>> other device which shouldn't be the case for devices sharing same SID.
>> Fix this by protecting iommu domain and iommu group creation with mutexes.
> 
> Robin -- any chance you could take a look at these, please? You had some
> comments on the first version which convinced me that they are needed,
> but I couldn't tell whether you wanted to solve this a different way or not.

Sorry, I was lamenting that this came to light due to the 
of_iommu_configure() flow being yucky, but that wasn't meant to imply 
that there aren't - or couldn't be in future - better reasons for 
iommu_probe_device() to be robust against concurrency anyway. I do think 
these are legitimate fixes to make in their own right, even if the 
current need might get swept back under the rug in future.

I would say, however, that the commit messages seem to focus too much on 
the wrong details and aren't overly useful, and patch #2 is missing 
Ashish's sign-off.

Thanks,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
