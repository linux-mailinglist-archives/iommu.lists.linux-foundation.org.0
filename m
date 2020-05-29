Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A819A1E81B8
	for <lists.iommu@lfdr.de>; Fri, 29 May 2020 17:23:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 08F8A25EC9;
	Fri, 29 May 2020 15:23:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7JqVw8Wv0a+w; Fri, 29 May 2020 15:23:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8B19025F6B;
	Fri, 29 May 2020 15:23:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70788C016F;
	Fri, 29 May 2020 15:23:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C45C6C016F
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 15:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C0395874C7
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 15:23:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xlAdjGsYZTw6 for <iommu@lists.linux-foundation.org>;
 Fri, 29 May 2020 15:23:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3D281874C5
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 15:23:13 +0000 (UTC)
IronPort-SDR: cl0to7az8tA1yQRpxMcE6iZxaHQEunJ6cFMsHV78W+jVBoInaoFbKrXqpasLQcnb0LCoBvnkub
 Lx6hgGVW3p7w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 08:23:12 -0700
IronPort-SDR: l318gQ8nIBDjKO4cXKwE+zpz60aCkP0wzi8myVgviAVc9I2MiVxMtmit7k1V0dCrayrFk/5DoI
 Cwl6hZii3y+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,449,1583222400"; d="scan'208";a="443425001"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga005.jf.intel.com with ESMTP; 29 May 2020 08:23:12 -0700
Date: Fri, 29 May 2020 08:29:30 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH] iommu/vt-d: Fix compile warning
Message-ID: <20200529082930.798466dc@jacob-builder>
In-Reply-To: <20200529131545.GE14598@8bytes.org>
References: <1590689031-79318-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <20200529131545.GE14598@8bytes.org>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>
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

On Fri, 29 May 2020 15:15:45 +0200
Joerg Roedel <joro@8bytes.org> wrote:

> Applied, thanks.
> 
> On Thu, May 28, 2020 at 11:03:51AM -0700, Jacob Pan wrote:
> > Make intel_svm_unbind_mm() a static function.
> > 
> > Fixes: 064a57d7ddfc ("iommu/vt-d: Replace intel SVM APIs with
> > generic SVA APIs")  
> 
> Please make sure the fixes tags (or any other tags) are not
> line-wrapped in future patch submissions.
> 
Got it, thanks.

> Thanks,
> 
> 	Joerg

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
