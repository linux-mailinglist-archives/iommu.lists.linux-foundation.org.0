Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7510E4B546A
	for <lists.iommu@lfdr.de>; Mon, 14 Feb 2022 16:18:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BB2C403B8;
	Mon, 14 Feb 2022 15:18:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PLKF5DLPJ1vn; Mon, 14 Feb 2022 15:18:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CCF57402A8;
	Mon, 14 Feb 2022 15:18:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7D41C000B;
	Mon, 14 Feb 2022 15:18:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A23BCC000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 15:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E39C402A8
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 15:18:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6LyOXaGkH1YG for <iommu@lists.linux-foundation.org>;
 Mon, 14 Feb 2022 15:18:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A012400A4
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 15:18:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E72F1063;
 Mon, 14 Feb 2022 07:18:39 -0800 (PST)
Received: from [10.57.70.89] (unknown [10.57.70.89])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 972823F70D;
 Mon, 14 Feb 2022 07:18:35 -0800 (PST)
Message-ID: <08e90a61-8491-acf1-ab0f-f93f97366d24@arm.com>
Date: Mon, 14 Feb 2022 15:18:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v1 3/8] iommu: Extend iommu_at[de]tach_device() for
 multi-device groups
Content-Language: en-GB
To: Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>
References: <20220106022053.2406748-1-baolu.lu@linux.intel.com>
 <20220106022053.2406748-4-baolu.lu@linux.intel.com>
 <Ygo/eCRFnraY01WA@8bytes.org> <20220214130313.GV4160@nvidia.com>
 <Ygppub+Wjq6mQEAX@8bytes.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <Ygppub+Wjq6mQEAX@8bytes.org>
Cc: Stuart Yoder <stuyoder@gmail.com>, rafael@kernel.org,
 David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Dmitry Osipenko <digetx@gmail.com>,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 Kevin Tian <kevin.tian@intel.com>, Chaitanya Kulkarni <kch@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Daniel Vetter <daniel@ffwll.ch>
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

On 2022-02-14 14:39, Joerg Roedel wrote:
> On Mon, Feb 14, 2022 at 09:03:13AM -0400, Jason Gunthorpe wrote:
>> Groups should disappear into an internal implementation detail, not be
>> so prominent in the API.
> 
> Not going to happen, IOMMU groups are ABI and todays device assignment
> code, including user-space, relies on them.
> 
> Groups implement and important aspect of hardware IOMMUs that the API
> can not abstract away: That there are devices which share the same
> request-id.
> 
> This is not an issue for devices concerned by iommufd, but for legacy
> device assignment it is. The IOMMU-API needs to handle both in a clean
> API, even if it means that drivers need to lookup the sub-group of a
> device first.
> 
> And I don't see how a per-device API can handle both in a device-centric
> way. For sure it is not making it 'device centric but operate on groups
> under the hood'.

Arguably, iommu_attach_device() could be renamed something like 
iommu_attach_group_for_dev(), since that's effectively the semantic that 
all the existing API users want anyway (even VFIO at the high level - 
the group is the means for the user to assign their GPU/NIC/whatever 
device to their process, not the end in itself). That's just a lot more 
churn.

It's not that callers should be blind to the entire concept of groups 
altogether - they remain a significant reason why iommu_attach_device() 
might fail, for one thing - however what callers really shouldn't need 
to be bothered with is the exact *implementation* of groups. I do 
actually quite like the idea of refining the group abstraction into 
isolation groups as a superset of alias groups, but if anything that's a 
further argument for not having the guts of the current abstraction 
exposed in places that don't need to care - otherwise that would be 
liable to be a microcosm of this series in itself: widespread churn vs. 
"same name, new meaning" compromises.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
