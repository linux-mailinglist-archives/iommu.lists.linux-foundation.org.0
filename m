Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A170D29CE56
	for <lists.iommu@lfdr.de>; Wed, 28 Oct 2020 07:11:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 573A6873E4;
	Wed, 28 Oct 2020 06:11:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jBCloVsIzcxQ; Wed, 28 Oct 2020 06:11:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 37A51873DE;
	Wed, 28 Oct 2020 06:11:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23D59C0051;
	Wed, 28 Oct 2020 06:11:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B845BC0051
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 06:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A763085CD5
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 06:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IqcPWsJedWRO for <iommu@lists.linux-foundation.org>;
 Wed, 28 Oct 2020 06:11:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 209F584854
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 06:11:22 +0000 (UTC)
IronPort-SDR: YBmysvXTvWRgv28vlsiS2Eb0hON54UdvJWqBmNB6sq3k6EaG50uMotDuke6WtDBCzo1sDpM+dX
 47P4ev/ojAAA==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="252909711"
X-IronPort-AV: E=Sophos;i="5.77,425,1596524400"; d="scan'208";a="252909711"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 23:11:21 -0700
IronPort-SDR: q6PZ2RzaMCywGokw2BsJMd3I5lNXt4lH7HLRFqxfABZdlO0w3kcQJkhkaWBzeqL1k3soHgDTEA
 iAwXJPECZRpA==
X-IronPort-AV: E=Sophos;i="5.77,425,1596524400"; d="scan'208";a="468605906"
Received: from yisun1-ubuntu.bj.intel.com (HELO yi.y.sun) ([10.238.156.116])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 27 Oct 2020 23:11:19 -0700
Date: Wed, 28 Oct 2020 14:06:41 +0800
From: Yi Sun <yi.y.sun@linux.intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v1 3/3] iommu/vt-d: Fix a bug for PDP check in
 prq_event_thread
Message-ID: <20201028060641.GD27139@yi.y.sun>
References: <1603849018-6578-1-git-send-email-yi.y.sun@linux.intel.com>
 <1603849018-6578-4-git-send-email-yi.y.sun@linux.intel.com>
 <5d43f0bd-c291-204e-973d-d496488f7a9d@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d43f0bd-c291-204e-973d-d496488f7a9d@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: dwmw2@infradead.org, iommu@lists.linux-foundation.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 20-10-28 13:05:05, Lu Baolu wrote:
> Hi Yi,
> 
> On 10/28/20 9:36 AM, Yi Sun wrote:
> >From: "Liu, Yi L" <yi.l.liu@intel.com>
> 
> Can you please add some description here? How far should this patch back
> ported? A Fixes tag?
> 
Sure. Will add description and Fixes tag.

> Best regards,
> baolu
> 
> >
> >Signed-off-by: Liu, Yi L <yi.l.liu@intel.com>
> >Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
> >---
> >  drivers/iommu/intel/svm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
> >index 75d9dc9..1870248 100644
> >--- a/drivers/iommu/intel/svm.c
> >+++ b/drivers/iommu/intel/svm.c
> >@@ -1032,7 +1032,7 @@ static irqreturn_t prq_event_thread(int irq, void *d)
> >  			resp.qw0 = QI_PGRP_PASID(req->pasid) |
> >  				QI_PGRP_DID(req->rid) |
> >  				QI_PGRP_PASID_P(req->pasid_present) |
> >-				QI_PGRP_PDP(req->pasid_present) |
> >+				QI_PGRP_PDP(req->priv_data_present) |
> >  				QI_PGRP_RESP_CODE(result) |
> >  				QI_PGRP_RESP_TYPE;
> >  			resp.qw1 = QI_PGRP_IDX(req->prg_index) |
> >
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
