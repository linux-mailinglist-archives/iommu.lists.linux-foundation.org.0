Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC26211BE9
	for <lists.iommu@lfdr.de>; Thu,  2 Jul 2020 08:22:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E668188F24;
	Thu,  2 Jul 2020 06:22:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c117VoCIQBzc; Thu,  2 Jul 2020 06:22:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B55E388F10;
	Thu,  2 Jul 2020 06:22:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F898C0733;
	Thu,  2 Jul 2020 06:22:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6257FC0733
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jul 2020 06:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3AD4F26316
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jul 2020 06:22:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xlf6mGqMXC9P for <iommu@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 06:22:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by silver.osuosl.org (Postfix) with ESMTPS id 6796A253CA
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jul 2020 06:22:41 +0000 (UTC)
IronPort-SDR: hBA5c9yjKzaLn6hJQi7FURedcb77EjmBhsY7FPVDZsCvoAvm9nvJW5Fx0kSlJVWWDD8IzeOV2H
 6zZF5P6yTmcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="164866038"
X-IronPort-AV: E=Sophos;i="5.75,303,1589266800"; d="scan'208";a="164866038"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 23:22:40 -0700
IronPort-SDR: LIeRYbr2nmV6Iwj4ogP9DmdggqXOqeepFNfDsGQSMbLg7LNVOyZYo2tuMuXdmKSlzm12jCJqNu
 y6oFkQ7/SvlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,303,1589266800"; d="scan'208";a="455400649"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga005.jf.intel.com with ESMTP; 01 Jul 2020 23:22:40 -0700
Date: Wed, 1 Jul 2020 23:29:16 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, "Raj, Ashok"
 <ashok.raj@intel.com>
Subject: IOASID set token
Message-ID: <20200701232916.38fd7908@jacob-builder>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Lu, Baolu" <baolu.lu@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Wu,
 Hao" <hao.wu@intel.com>
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

Hi Jean,

Have a question for you on whether we can have a fixed token type for
ioasid_set.

Currently, ioasid_set has an arbitrary token. For VT-d vSVA usage, we
choose mm as ioasid_set token to identify PASIDs within a guest. We have
multiple in-kernel users of PASIDs such as VFIO, KVM, and VDCM. When an
IOASID set is created, there is not a good way to communicate about the
token choices. So we have to let VDCM and KVM *assume* mm is used as
token, then retrieve ioasid_set based on the token.

This assumption of "mm as token" is not a reliable SW architecture. So
we are thinking if we can have an explicit ioasid_set token type where
mm is used. After all, PASID and mm are closely related.

The code change might be the following:
1. add a flag to indicate token type when ioasid_set is allocated, e.g.
IOASID_SET_TYPE_MM
IOASID_SET_TYPE_ANY
2. other users of the ioasid_set can query if an mm token exists based
on the flag IOASID_SET_TYPE_MM, then retrieve the ioasid_set.

Existing ioasid_set user can still use arbitrary token under the flag
IOASID_SET_TYPE_ANY

Would this be an issue for ARM usage?

Thanks,

Jacob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
