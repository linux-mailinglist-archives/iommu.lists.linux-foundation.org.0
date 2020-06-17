Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 761451FD582
	for <lists.iommu@lfdr.de>; Wed, 17 Jun 2020 21:39:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1B5B420412;
	Wed, 17 Jun 2020 19:39:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sfndvT0bh7w1; Wed, 17 Jun 2020 19:39:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 968202151E;
	Wed, 17 Jun 2020 19:39:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F555C016E;
	Wed, 17 Jun 2020 19:39:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0D25C016E
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 19:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AFBD487921
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 19:39:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m0LS72XhauYF for <iommu@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 19:39:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EDCE8878B2
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 19:39:45 +0000 (UTC)
IronPort-SDR: ctjceJKBvb/BS/bbYBj+EW/ffslnKhYAbaCKbGFMwTL87ohgHvCgfvXssWiVaC/3DhNm8MjSmJ
 m+hB1n08QBow==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 12:39:45 -0700
IronPort-SDR: XlOkZWuUqUJIMX3YBJ641L9Zny0vHQ3jjFJ0lLYzgPZoGdYYh0V+M5UafI1dtz9Eglt47VJwI7
 0sv5dlw7OpgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,523,1583222400"; d="scan'208";a="476968932"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
 by fmsmga005.fm.intel.com with ESMTP; 17 Jun 2020 12:39:44 -0700
Received: from orsmsx115.amr.corp.intel.com ([169.254.4.56]) by
 ORSMSX107.amr.corp.intel.com ([169.254.1.92]) with mapi id 14.03.0439.000;
 Wed, 17 Jun 2020 12:39:43 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Andy Lutomirski <luto@kernel.org>, "Yu, Fenghua" <fenghua.yu@intel.com>
Subject: RE: [PATCH v3 01/13] iommu: Change type of pasid to unsigned int
Thread-Topic: [PATCH v3 01/13] iommu: Change type of pasid to unsigned int
Thread-Index: AQHWRNSCgq6s3Eb3TUCTrKgNEKKtfajdqISA//+LkWA=
Date: Wed, 17 Jun 2020 19:39:43 +0000
Message-ID: <3908561D78D1C84285E8C5FCA982C28F7F67216A@ORSMSX115.amr.corp.intel.com>
References: <1592418233-17762-1-git-send-email-fenghua.yu@intel.com>
 <1592418233-17762-2-git-send-email-fenghua.yu@intel.com>
 <CALCETrXFHa_05-sGAy5M9YGJWUfTn9MfM-ZYk+hp12tqHNJA0Q@mail.gmail.com>
In-Reply-To: <CALCETrXFHa_05-sGAy5M9YGJWUfTn9MfM-ZYk+hp12tqHNJA0Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Jiang,
 Dave" <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>, "Shankar,
 Ravi V" <ravi.v.shankar@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "Hansen,
 Dave" <dave.hansen@intel.com>, iommu <iommu@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "Pan,
 Jacob jun" <jacob.jun.pan@intel.com>, H
 Peter Anvin <hpa@zytor.com>, Christoph Hellwig <hch@infradeed.org>,
 Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
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

> Is PASID in the uapi at all?


$ grep pasid include/uapi/linux/iommu.h
* @pasid: Process Address Space ID
        __u32   pasid;
 * @pasid: Process Address Space ID
        __u32   pasid;
 * @pasid: Process Address Space ID
        __u32   pasid;
 * - If the PASID bit is set, the @pasid field is populated and the invalidation
 * @pasid: process address space ID
        __u64   pasid;
 * struct iommu_inv_pasid_info - PASID Selective Invalidation Structure
 * - If the PASID bit is set, the @pasid field is populated and the invalidation
 * @pasid: process address space ID
struct iommu_inv_pasid_info {
        __u64   pasid;
 * @pasid_info: invalidation data when @granularity is %IOMMU_INV_GRANU_PASID
                struct iommu_inv_pasid_info pasid_info;
 * struct iommu_gpasid_bind_data_vtd - Intel VT-d specific data on device and guest
struct iommu_gpasid_bind_data_vtd {
 * struct iommu_gpasid_bind_data - Information about device and guest PASID binding
 * @hpasid:     Process address space ID used for the guest mm in host IOMMU
 * @gpasid:     Process address space ID used for the guest mm in guest IOMMU
struct iommu_gpasid_bind_data {
        __u64 hpasid;
        __u64 gpasid;
                struct iommu_gpasid_bind_data_vtd vtd;
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
