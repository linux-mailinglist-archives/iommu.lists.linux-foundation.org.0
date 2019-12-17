Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF7312219E
	for <lists.iommu@lfdr.de>; Tue, 17 Dec 2019 02:40:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 69B2086702;
	Tue, 17 Dec 2019 01:40:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f1_5hOEAPLjv; Tue, 17 Dec 2019 01:40:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F348486549;
	Tue, 17 Dec 2019 01:40:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DAC6BC1AE8;
	Tue, 17 Dec 2019 01:40:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D69A7C077D
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 01:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B67388765A
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 01:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HIGxwmKCTm9U for <iommu@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 01:40:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1849E8687B
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 01:40:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 17:40:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,323,1571727600"; d="scan'208";a="227319975"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
 ([10.239.159.136])
 by orsmga002.jf.intel.com with ESMTP; 16 Dec 2019 17:40:04 -0800
Subject: Re: [PATCH v3 5/6] iommu/vt-d: Flush PASID-based iotlb for iova over
 first level
To: "Liu, Yi L" <yi.l.liu@intel.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20191211021219.8997-1-baolu.lu@linux.intel.com>
 <20191211021219.8997-6-baolu.lu@linux.intel.com>
 <A2975661238FB949B60364EF0F2C25743A130C08@SHSMSX104.ccr.corp.intel.com>
 <f1e5cfea-8b11-6d72-8e57-65daea51c050@linux.intel.com>
 <A2975661238FB949B60364EF0F2C25743A132C50@SHSMSX104.ccr.corp.intel.com>
 <6a5f6695-d1fd-e7d1-3ea3-f222a1ef0e54@linux.intel.com>
 <b4a879b2-a5c7-b0bf-8cd4-7397aeebc381@linux.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <2b024c1e-79bd-6827-47e6-ae9457054c79@linux.intel.com>
Date: Tue, 17 Dec 2019 09:39:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <b4a879b2-a5c7-b0bf-8cd4-7397aeebc381@linux.intel.com>
Content-Language: en-US
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Kumar,
 Sanjay K" <sanjay.k.kumar@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Sun,
 Yi Y" <yi.y.sun@intel.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

SGksCgpPbiAxMi8xNy8xOSA5OjM3IEFNLCBMdSBCYW9sdSB3cm90ZToKPiBZb3UgYXJlIHJpZ2h0
LiBJIHdpbGwgY2hhbmdlIGl0IGFjY29yZGluZ2x5LiBUaGUgbG9naWMgc2hvdWxkIGxvb2sKPiBs
aWtlOgo+IAo+IGlmIChkb21haW4gYXR0YWNoZWQgdG8gcGh5c2ljYWwgZGV2aWNlKQo+ICDCoMKg
wqDCoGZsdXNoX3Bpb3RsYl93aXRoX1JJRDJQQVNJRCgpCj4gZWxzZSBpZiAoZG9tYWluX2F0dGFj
aGVkX3RvX21kZXZfZGV2aWNlKQo+ICDCoMKgwqDCoGZsdXNoX3Bpb3RsYl93aXRoX2RlZmF1bHRf
cGFzaWQoKQo+IAoKQm90aCEgc28gbm8gImVsc2UiIGhlcmUuCgpCZXN0IHJlZ2FyZHMsCmJhb2x1
Cgo+IERvZXMgdGhpcyB3b3JrIGZvciB5b3U/IFRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhpcyEKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGlu
ZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
