Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB7121F728
	for <lists.iommu@lfdr.de>; Tue, 14 Jul 2020 18:23:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DF65F88483;
	Tue, 14 Jul 2020 16:22:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r6V--0yT_z9I; Tue, 14 Jul 2020 16:22:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4A3D388389;
	Tue, 14 Jul 2020 16:22:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C41EC0733;
	Tue, 14 Jul 2020 16:22:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A354C0733
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 16:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0560F89143
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 16:22:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id km1hkmixbIQY for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 16:22:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 596C58902C
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 16:22:56 +0000 (UTC)
IronPort-SDR: sd879woxbrL+YdZWCtPXuJaQy5iAAERTdoy/W6sh0KAgZ3cbfWSXQB+Q8tarKPKmuhJnNjSDcu
 cea0opzHDnhQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="137090096"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="137090096"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 09:22:55 -0700
IronPort-SDR: XG9gv2O1W+1MwY9PC281NcQw4piXHodJVfXIVBKjQu/wCBp6LNT5cIevM+q9ASR0opidevLJZT
 uwGSUNRmtPdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="285805875"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga006.jf.intel.com with ESMTP; 14 Jul 2020 09:22:48 -0700
Date: Tue, 14 Jul 2020 09:29:30 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 4/4] vfio/type1: Use iommu_aux_at(de)tach_group() APIs
Message-ID: <20200714092930.4b61b77c@jacob-builder>
In-Reply-To: <20200714082514.GA30622@infradead.org>
References: <20200714055703.5510-1-baolu.lu@linux.intel.com>
 <20200714055703.5510-5-baolu.lu@linux.intel.com>
 <20200714082514.GA30622@infradead.org>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Kevin Tian <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Alex Williamson <alex.williamson@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>
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

On Tue, 14 Jul 2020 09:25:14 +0100
Christoph Hellwig <hch@infradead.org> wrote:

> On Tue, Jul 14, 2020 at 01:57:03PM +0800, Lu Baolu wrote:
> > Replace iommu_aux_at(de)tach_device() with
> > iommu_aux_at(de)tach_group(). It also saves the
> > IOMMU_DEV_FEAT_AUX-capable physcail device in the vfio_group data
> > structure so that it could be reused in other places.  
> 
> This removes the last user of iommu_aux_attach_device and
> iommu_aux_detach_device, which can be removed now.
it is still used in patch 2/4 inside iommu_aux_attach_group(), right?

> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
