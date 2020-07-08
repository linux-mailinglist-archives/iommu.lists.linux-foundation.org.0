Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEF2218B20
	for <lists.iommu@lfdr.de>; Wed,  8 Jul 2020 17:23:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3114785C5E;
	Wed,  8 Jul 2020 15:22:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CaOmVg_Gc-jH; Wed,  8 Jul 2020 15:22:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DF03F85C5C;
	Wed,  8 Jul 2020 15:22:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B34A6C016F;
	Wed,  8 Jul 2020 15:22:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F2EFC016F
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 15:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2BBD588C1D
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 15:22:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NqQimktVmM52 for <iommu@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 15:22:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8530D88C08
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 15:22:27 +0000 (UTC)
IronPort-SDR: IkK7L/jVkYHv4ccMfp+/UHPwZUTTpfOOLXWLkm72+beNgBThHkVpb83DGg8f7QesNwbUwqgVOh
 lBwDsQHuAurw==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="135281649"
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="135281649"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 08:22:26 -0700
IronPort-SDR: Bm2u0Vasa2bnwwN+WYUNG+lwMSlKRZ0VAGFlbB/8mL6kec0+obJsV1ZPaOMAL6W2B8XTK94Vnj
 geu4Bkd0fXwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="427869822"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga004.jf.intel.com with ESMTP; 08 Jul 2020 08:22:26 -0700
Date: Wed, 8 Jul 2020 08:29:05 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v4 1/5] docs: IOMMU user API
Message-ID: <20200708082905.1b5da847@jacob-builder>
In-Reply-To: <6d01dac0-aa9d-e22b-9baf-28c2f538871a@linux.intel.com>
References: <1594165429-20075-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1594165429-20075-2-git-send-email-jacob.jun.pan@linux.intel.com>
 <6d01dac0-aa9d-e22b-9baf-28c2f538871a@linux.intel.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
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

On Wed, 8 Jul 2020 10:07:13 +0800
Lu Baolu <baolu.lu@linux.intel.com> wrote:

> Hi,
> 
> On 7/8/20 7:43 AM, Jacob Pan wrote:
> > +For UAPIs that are shared with in-kernel users, a wrapper function
> > +is provided to distinguish the callers. For example,
> > +
> > +Userspace caller ::
> > +
> > +  int iommu_sva_unbind_gpasid(struct iommu_domain *domain, struct
> > device *dev,
> > +  void __user *udata)
> > +
> > +In-kernel caller ::
> > +
> > +  int __iommu_sva_unbind_gpasid(struct iommu_domain *domain,
> > struct device *dev,
> > +  struct iommu_gpasid_bind_data *data)  
> 
> iommu_page_response() may have the same needs. Can we reach an
> agreement on the naming rules?
> 
Yes iommu_page_response() also has to deal with in-kernel and UAPI
callers. I left it out because I thought the current VFIO and SVA common
code is not ready for PRQ yet, I might be reading old news :) argsz
need to be handled as well.

Perhaps we can wait until this set is settled? Do you have a suggestion
on the naming rules?

> Best regards,
> baolu

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
