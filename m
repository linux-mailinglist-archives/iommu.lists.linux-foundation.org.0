Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6078E30C629
	for <lists.iommu@lfdr.de>; Tue,  2 Feb 2021 17:41:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0F9002040C;
	Tue,  2 Feb 2021 16:41:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YsxYqtuH8dV4; Tue,  2 Feb 2021 16:41:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 61376203EE;
	Tue,  2 Feb 2021 16:41:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50833C013A;
	Tue,  2 Feb 2021 16:41:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 188A8C013A
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 16:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F419586DF0
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 16:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7NT-oGHiSjls for <iommu@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 16:41:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6335E86D52
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 16:41:28 +0000 (UTC)
IronPort-SDR: Z4kz4lv2Wtw/qVjK8aWLgU3DkL2rx4xN+aRXBOoaYXXFL9qgSe4Gs2oW4xrFhZ2D45eXkaQ+ne
 n6/ozuZKijuA==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="181029002"
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; d="scan'208";a="181029002"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 08:41:05 -0800
IronPort-SDR: Eg+PeupmJB38Swuetqqo43nQrCypvHKzH7vo8Lzx7eWKLBcq1cAlygGlegUyVr2t2BYtaiY6w2
 EXjdQ83jzDfA==
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; d="scan'208";a="413654954"
Received: from otc-nc-03.jf.intel.com (HELO otc-nc-03) ([10.54.39.36])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 08:41:04 -0800
Date: Tue, 2 Feb 2021 08:41:02 -0800
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 2/3] iommu/vt-d: Parse SATC reporting structure
Message-ID: <20210202164102.GD39643@otc-nc-03>
References: <20210202044057.615277-1-baolu.lu@linux.intel.com>
 <20210202044057.615277-3-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202044057.615277-3-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Ashok Raj <ashok.raj@intel.com>, iommu@lists.linux-foundation.org,
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

On Tue, Feb 02, 2021 at 12:40:56PM +0800, Lu Baolu wrote:
> From: Yian Chen <yian.chen@intel.com>
> 
> Software should parse every SATC table and all devices in the tables
> reported by the BIOS and keep the information in kernel list for further
> SATC policy deployment.
> 
The last part seems bit vague? Are you trying to imply, 

if kernel is booted with noats for instance, a device listed in SATC table
as "requires ATS" will fail to load?

Otherwise its not clear what the policy enforcement means.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
