Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA3C52E894
	for <lists.iommu@lfdr.de>; Fri, 20 May 2022 11:18:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF7F98433F;
	Fri, 20 May 2022 09:18:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 96scC-eFc-Hy; Fri, 20 May 2022 09:18:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B1D8683F1F;
	Fri, 20 May 2022 09:18:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A753C002D;
	Fri, 20 May 2022 09:18:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD3D5C002D
 for <iommu@lists.linux-foundation.org>; Fri, 20 May 2022 09:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D30CF4010E
 for <iommu@lists.linux-foundation.org>; Fri, 20 May 2022 09:18:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GV6fF3OeiEaR for <iommu@lists.linux-foundation.org>;
 Fri, 20 May 2022 09:18:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D922400D2
 for <iommu@lists.linux-foundation.org>; Fri, 20 May 2022 09:18:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF0A81477;
 Fri, 20 May 2022 02:18:26 -0700 (PDT)
Received: from [10.57.82.55] (unknown [10.57.82.55])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C14D83F66F;
 Fri, 20 May 2022 02:18:25 -0700 (PDT)
Message-ID: <c10de7b0-ca73-e2a8-bdc5-1a3a9edd5f30@arm.com>
Date: Fri, 20 May 2022 10:18:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] iommu/amd: Set translation valid bit only when IO page
 tables are in used
Content-Language: en-GB
To: Joerg Roedel <joro@8bytes.org>
References: <20220509074815.11881-1-suravee.suthikulpanit@amd.com>
 <Yn5YIfzmerwAM30M@8bytes.org> <1dfaf07e-040e-848b-db7c-86a107fd5cb3@amd.com>
 <YodMvV/8eii4KCLg@8bytes.org> <794e13dd-8eae-481d-711d-b5462fdbfb18@arm.com>
 <YodYTZzSd9fZucLT@8bytes.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <YodYTZzSd9fZucLT@8bytes.org>
Cc: iommu@lists.linux-foundation.org, jon.grimm@amd.com,
 linux-kernel@vger.kernel.org, vasant.hegde@amd.com
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

On 2022-05-20 09:58, Joerg Roedel wrote:
> On Fri, May 20, 2022 at 09:54:51AM +0100, Robin Murphy wrote:
>> The .def_domain type op already allows drivers to do exactly this sort of
>> override. You could also conditionally reject IOMMU_DOMAIN_PASSTHROUGH in
>> .domain_alloc for good measure, provided that (for now at least*) SNP is a
>> global thing rather than per-instance.
> 
> Yeah, that could work. I am just not sure the IOMMU core behaves well in
> all situations when allocation IOMMU_DOMAIN_PASSTHROUGH suddenly starts
> to fail. I would feel better if this is checked and tested :)

Well, iommu_group_alloc_default_domain() has the fallback and is 
currently the only place that __iommu_domain_alloc() can be called with 
a type other than IOMMU_DOMAIN_UNMANAGED, so by inspection it should be 
fine. However if iommu_get_def_domain_type() says the right thing then 
neither sysfs nor automatic default domains should get as far as even 
trying to allocate an identity domain anyway - note that that's already 
what happens for untrusted external devices. But either way should be 
easy enough to verify with a quick hack, too.

Cheers,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
