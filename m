Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9806F1C0862
	for <lists.iommu@lfdr.de>; Thu, 30 Apr 2020 22:42:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1FB8D86F40;
	Thu, 30 Apr 2020 20:42:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JevjgW15zUp6; Thu, 30 Apr 2020 20:42:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9B6AF86F45;
	Thu, 30 Apr 2020 20:42:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E3B0C016F;
	Thu, 30 Apr 2020 20:42:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 748CDC016F
 for <iommu@lists.linux-foundation.org>; Thu, 30 Apr 2020 20:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6A9B586E40
 for <iommu@lists.linux-foundation.org>; Thu, 30 Apr 2020 20:42:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CbeN1memEJeX for <iommu@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 20:42:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B1AB186E41
 for <iommu@lists.linux-foundation.org>; Thu, 30 Apr 2020 20:42:40 +0000 (UTC)
IronPort-SDR: Ul69p+G7vOeg5LSQZdILW2m34a/uc6AGIjelvZUqiJWD/quigvAnPkOwbk6CPPx4xtRS4k9/5z
 8X+kXii5IhgA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 13:42:39 -0700
IronPort-SDR: M6oqOMPzyFoVqddYs7RXgFErbffJCDivKopljAfdVamHixYraY4H4gkBAqaneuwRMIgM/plR4C
 XjTmGyPtMWrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,337,1583222400"; d="scan'208";a="433100232"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga005.jf.intel.com with ESMTP; 30 Apr 2020 13:42:39 -0700
Date: Thu, 30 Apr 2020 13:48:42 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v6 02/25] iommu/ioasid: Add ioasid references
Message-ID: <20200430134842.74e596b8@jacob-builder>
In-Reply-To: <20200430113931.0fbf7a37@jacob-builder>
References: <20200430143424.2787566-1-jean-philippe@linaro.org>
 <20200430143424.2787566-3-jean-philippe@linaro.org>
 <20200430113931.0fbf7a37@jacob-builder>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, kevin.tian@intel.com, jgg@ziepe.ca,
 linux-pci@vger.kernel.org, robin.murphy@arm.com, fenghua.yu@intel.com,
 hch@infradead.org, linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 zhangfei.gao@linaro.org, catalin.marinas@arm.com, felix.kuehling@amd.com,
 will@kernel.org, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org
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

On Thu, 30 Apr 2020 11:39:31 -0700
Jacob Pan <jacob.jun.pan@linux.intel.com> wrote:

> > -void ioasid_free(ioasid_t ioasid)
> > +bool ioasid_free(ioasid_t ioasid)
> >  {
Sorry I missed this in the last reply.

I think free needs to be unconditional since there is not a good way to
fail it.

Also can we have more symmetric APIs, seems we don't have ioasid_put()
in this patchset.
How about?
ioasid_alloc()
ioasid_free(); //drop reference, mark inactive, but not reclaimed if
		refcount is not zero.
ioasid_get() // returns err if the ioasid is marked inactive by
		ioasid_free()
ioasid_put();// drop reference, reclaim if refcount is 0.

It is similar to get/put/alloc/free pids.


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
