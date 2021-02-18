Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 383D331F4F5
	for <lists.iommu@lfdr.de>; Fri, 19 Feb 2021 07:02:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 90BDD86F97;
	Fri, 19 Feb 2021 06:02:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EhefX-0un-vQ; Fri, 19 Feb 2021 06:02:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7B19286FD4;
	Fri, 19 Feb 2021 06:02:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 666E2C000D;
	Fri, 19 Feb 2021 06:02:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3F30C000D
 for <iommu@lists.linux-foundation.org>; Fri, 19 Feb 2021 06:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A3A9E872B2
 for <iommu@lists.linux-foundation.org>; Fri, 19 Feb 2021 06:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RlwHAA8WB5Tp for <iommu@lists.linux-foundation.org>;
 Fri, 19 Feb 2021 06:02:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 255DA8739D
 for <iommu@lists.linux-foundation.org>; Fri, 19 Feb 2021 06:02:31 +0000 (UTC)
IronPort-SDR: EiCWqfRpgLjeEaoNcdlJo3DUmdehaCkz1OOVpf2sJ/Rj9tXHcHvvNo6Fzc7+cv8uZ5rxc2lj0v
 dRrMmvmxAj8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="245198118"
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; d="scan'208";a="245198118"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 22:02:29 -0800
IronPort-SDR: s+fIb4QD/vBaxgq18YunFtfCEmI1STTMWABa4tRhkWoJlKIPQQxjw1HCF6U2gdksyNKviA1V/P
 iqyqzS80+y5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; d="scan'208";a="362829355"
Received: from otc-wp-03.jf.intel.com ([10.54.39.79])
 by orsmga003.jf.intel.com with ESMTP; 18 Feb 2021 22:02:29 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Joerg Roedel <joro@8bytes.org>, "Lu Baolu" <baolu.lu@linux.intel.com>
Subject: [PATCH 4/4] iommu/vt-d: Calculate and set flags for handle_mm_fault
Date: Thu, 18 Feb 2021 13:31:18 -0800
Message-Id: <1613683878-89946-5-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613683878-89946-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1613683878-89946-1-git-send-email-jacob.jun.pan@linux.intel.com>
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Raj Ashok <ashok.raj@intel.com>, Yi Sun <yi.y.sun@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>, Wu Hao <hao.wu@intel.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

UGFnZSByZXF1ZXN0cyBhcmUgb3JpZ2luYXRlZCBmcm9tIHRoZSB1c2VyIHBhZ2UgZmF1bHQuIFRo
ZXJlZm9yZSwgd2UKc2hhbGwgc2V0wqBGQVVMVF9GTEFHX1VTRVIuwqAKCkZBVUxUX0ZMQUdfUkVN
T1RFIGluZGljYXRlcyB0aGF0IHdlIGFyZcKgd2Fsa2luZyBhbiBtbSB3aGljaCBpcyBub3QKZ3Vh
cmFudGVlZCB0byBiZSB0aGUgc2FtZSBhcyB0aGXCoGN1cnJlbnQtPm1tIGFuZCBzaG91bGQgbm90
IGJlIHN1YmplY3QKdG8gcHJvdGVjdGlvbiBrZXnCoGVuZm9yY2VtZW50LiBUaGVyZWZvcmUsIHdl
IHNob3VsZCBzZXTCoEZBVUxUX0ZMQUdfUkVNT1RFCnRvIGF2b2lkIGZhdWx0cyB3aGVuIGJvdGgg
U1ZNIGFuZCBQS0VZIGFyZSB1c2VkLgoKUmVmZXJlbmNlczogY29tbWl0IDFiMmVlMTI2NmVhNiAo
Im1tL2NvcmU6IERvIG5vdCBlbmZvcmNlIFBLRVkgcGVybWlzc2lvbnMgb24gcmVtb3RlIG1tIGFj
Y2VzcyIpClJldmlld2VkLWJ5OiBSYWogQXNob2sgPGFzaG9rLnJhakBpbnRlbC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEphY29iIFBhbiA8amFjb2IuanVuLnBhbkBsaW51eC5pbnRlbC5jb20+Ci0tLQog
ZHJpdmVycy9pb21tdS9pbnRlbC9zdm0uYyB8IDkgKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9t
bXUvaW50ZWwvc3ZtLmMgYi9kcml2ZXJzL2lvbW11L2ludGVsL3N2bS5jCmluZGV4IGZmN2FlN2Nj
MTdkNS4uN2JmZDIwYTI0YTYwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lvbW11L2ludGVsL3N2bS5j
CisrKyBiL2RyaXZlcnMvaW9tbXUvaW50ZWwvc3ZtLmMKQEAgLTEwODYsNiArMTA4Niw3IEBAIHN0
YXRpYyBpcnFyZXR1cm5fdCBwcnFfZXZlbnRfdGhyZWFkKGludCBpcnEsIHZvaWQgKmQpCiAJc3Ry
dWN0IGludGVsX2lvbW11ICppb21tdSA9IGQ7CiAJc3RydWN0IGludGVsX3N2bSAqc3ZtID0gTlVM
TDsKIAlpbnQgaGVhZCwgdGFpbCwgaGFuZGxlZCA9IDA7CisJdW5zaWduZWQgaW50IGZsYWdzID0g
MDsKIAogCS8qIENsZWFyIFBQUiBiaXQgYmVmb3JlIHJlYWRpbmcgaGVhZC90YWlsIHJlZ2lzdGVy
cywgdG8KIAkgKiBlbnN1cmUgdGhhdCB3ZSBnZXQgYSBuZXcgaW50ZXJydXB0IGlmIG5lZWRlZC4g
Ki8KQEAgLTExODYsOSArMTE4NywxMSBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgcHJxX2V2ZW50X3Ro
cmVhZChpbnQgaXJxLCB2b2lkICpkKQogCQlpZiAoYWNjZXNzX2Vycm9yKHZtYSwgcmVxKSkKIAkJ
CWdvdG8gaW52YWxpZDsKIAotCQlyZXQgPSBoYW5kbGVfbW1fZmF1bHQodm1hLCBhZGRyZXNzLAot
CQkJCSAgICAgIHJlcS0+d3JfcmVxID8gRkFVTFRfRkxBR19XUklURSA6IDAsCi0JCQkJICAgICAg
TlVMTCk7CisJCWZsYWdzID0gRkFVTFRfRkxBR19VU0VSIHwgRkFVTFRfRkxBR19SRU1PVEU7CisJ
CWlmIChyZXEtPndyX3JlcSkKKwkJCWZsYWdzIHw9IEZBVUxUX0ZMQUdfV1JJVEU7CisKKwkJcmV0
ID0gaGFuZGxlX21tX2ZhdWx0KHZtYSwgYWRkcmVzcywgZmxhZ3MsIE5VTEwpOwogCQlpZiAocmV0
ICYgVk1fRkFVTFRfRVJST1IpCiAJCQlnb3RvIGludmFsaWQ7CiAKLS0gCjIuMjUuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBs
aXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
