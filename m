Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5436A56CD84
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B00E560E79;
	Sun, 10 Jul 2022 06:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B00E560E79
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=boDw/T3O
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UgjXxeRqZnD8; Sun, 10 Jul 2022 06:37:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 856E160E36;
	Sun, 10 Jul 2022 06:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 856E160E36
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97F1EC008A;
	Sun, 10 Jul 2022 06:37:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06F28C002D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 16:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92FB984842
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 16:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92FB984842
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com
 header.a=rsa-sha256 header.s=20200525 header.b=boDw/T3O
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 80Nl6N_3sqii for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jul 2022 16:51:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9B0B84843
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9B0B84843
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 16:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Cc:To:From:content-disposition;
 bh=rTRb+/So/4EWEZ45msTESV3Xx/IfhAVRRKsYbmWz88w=; b=boDw/T3OLLCbj221FqjfwANe11
 vAAJKxjURenUnC6LcrRQSb00rB7JUyYQbZZU4F6NG1eUTL/3c9WbUHkPIi1SwiDACiT1DiyashnUX
 tFqQM9aSfLkyMcPz0TY0PVj5P0+SABZ4KVUDbofgojU3sZNVV3D5eAhoyLwDEgZS9dNbjRk2f/LTB
 yZPC3h4+QaVQyAThd2QaTnXxWjTNFBFYTeqvb7BWSWIHCSbbKf7smx6xbURna/koL0Bgp9z9jc+BW
 xAwOl55pC1o6Ff9saZIoI/sRItIuXXcNkdabWLWkQCXBgb3N7spZ+GelJnExEgPkJfQpgen/cNs6l
 lZG+hURw==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <gunthorp@deltatee.com>)
 id 1o9rCB-009xkF-SA; Fri, 08 Jul 2022 10:51:14 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim
 4.94.2) (envelope-from <gunthorp@deltatee.com>)
 id 1o9rC9-0001Jl-1m; Fri, 08 Jul 2022 10:51:09 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, iommu@lists.linux.dev
Date: Fri,  8 Jul 2022 10:50:52 -0600
Message-Id: <20220708165104.5005-2-logang@deltatee.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220708165104.5005-1-logang@deltatee.com>
References: <20220708165104.5005-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, iommu@lists.linux.dev, sbates@raithlin.com,
 hch@lst.de, jgg@ziepe.ca, christian.koenig@amd.com, ddutile@redhat.com,
 willy@infradead.org, daniel.vetter@ffwll.ch, jason@jlekstrand.net,
 dave.hansen@linux.intel.com, helgaas@kernel.org, dan.j.williams@intel.com,
 dave.b.minturn@intel.com, jianxin.xiong@intel.com, ira.weiny@intel.com,
 robin.murphy@arm.com, martin.oliveira@eideticom.com, ckulkarnilinux@gmail.com,
 jhubbard@nvidia.com, rcampbell@nvidia.com, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH v8 01/13] lib/scatterlist: add flag for indicating P2PDMA
 segments in an SGL
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-Mailman-Approved-At: Sun, 10 Jul 2022 06:37:28 +0000
Cc: Minturn Dave B <dave.b.minturn@intel.com>,
 Martin Oliveira <martin.oliveira@eideticom.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>,
 Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Logan Gunthorpe <logang@deltatee.com>,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bjorn Helgaas <helgaas@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Stephen Bates <sbates@raithlin.com>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>, Xiong Jianxin <jianxin.xiong@intel.com>
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

SW50cm9kdWNlIGEgZG1hX2ZsYWdzIGZpZWxkIGluIHN0cnVjdCBzY2F0dGVybGlzdC4gVGhlc2Ug
ZmxhZ3Mgd2lsbCBiZQp1c2VkIGJ5IGRtYV9bdW5dbWFwX3NnX3AycGRtYSgpIHRvIGRldGVybWlu
ZSB3aGVuIGEgZ2l2ZW4gU0dMIHNlZ21lbnRzCmRtYV9hZGRyZXNzIHBvaW50cyB0byBhIFBDSSBi
dXMgYWRkcmVzcy4gZG1hX3VubWFwX3NnX3AycGRtYSgpIHdpbGwgbmVlZAp0byBwZXJmb3JtIGRp
ZmZlcmVudCBjbGVhbnVwIHdoZW4gYSBzZWdtZW50IGlzIG1hcmtlZCBhcyBhIGJ1cyBhZGRyZXNz
LgoKVGhlIGRtYV9mbGFncyBmaWVsZCB3aWxsIGZpdCBpbiB0aGUgZXhpc3RpbmcgcGFkZGluZyBv
biA2NEJJVCBzeXN0ZW1zCihhc3N1bWluZyBDT05GSUdfTkVFRF9TR19ETUFfTEVOR1RIIGlzIGFs
c28gc2V0KS4KClRoZSBuZXcgYml0IHdpbGwgb25seSBiZSB1c2VkIHdoZW4gQ09ORklHX1BDSV9Q
MlBETUEgaXMgc2V0OyB0aGlzIG1lYW5zClBDSSBQMlBETUEgd2lsbCByZXF1aXJlIENPTkZJR182
NEJJVC4gVGhpcyBzaG91bGQgYmUgYWNjZXB0YWJsZSBhcyB0aGUKbWFqb3JpdHkgb2YgUDJQRE1B
IHVzZSBjYXNlcyBhcmUgcmVzdHJpY3RlZCB0byBuZXdlciByb290IGNvbXBsZXhlcyBhbmQKcm91
Z2hseSByZXF1aXJlIHRoZSBleHRyYSBhZGRyZXNzIHNwYWNlIGZvciBtZW1vcnkgQkFScyB1c2Vk
IGluIHRoZQp0cmFuc2FjdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBMb2dhbiBHdW50aG9ycGUgPGxv
Z2FuZ0BkZWx0YXRlZS5jb20+Ci0tLQogZHJpdmVycy9wY2kvS2NvbmZpZyAgICAgICAgIHwgIDUg
KysrCiBpbmNsdWRlL2xpbnV4L3NjYXR0ZXJsaXN0LmggfCA2OSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDc0IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9LY29uZmlnIGIvZHJpdmVycy9wY2kvS2NvbmZpZwppbmRl
eCAxMzNjNzMyMDc3ODIuLjVjYzdjYmExOTQxZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvS2Nv
bmZpZworKysgYi9kcml2ZXJzL3BjaS9LY29uZmlnCkBAIC0xNjQsNiArMTY0LDExIEBAIGNvbmZp
ZyBQQ0lfUEFTSUQKIGNvbmZpZyBQQ0lfUDJQRE1BCiAJYm9vbCAiUENJIHBlZXItdG8tcGVlciB0
cmFuc2ZlciBzdXBwb3J0IgogCWRlcGVuZHMgb24gWk9ORV9ERVZJQ0UKKwkjCisJIyBUaGUgbmVl
ZCBmb3IgdGhlIHNjYXR0ZXJsaXN0IERNQSBidXMgYWRkcmVzcyBmbGFnIG1lYW5zIFBDSSBQMlBE
TUEKKwkjIHJlcXVpcmVzIDY0Yml0CisJIworCWRlcGVuZHMgb24gNjRCSVQKIAlzZWxlY3QgR0VO
RVJJQ19BTExPQ0FUT1IKIAloZWxwCiAJICBFbmFibGXRlSBkcml2ZXJzIHRvIGRvIFBDSSBwZWVy
LXRvLXBlZXIgdHJhbnNhY3Rpb25zIHRvIGFuZCBmcm9tCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L3NjYXR0ZXJsaXN0LmggYi9pbmNsdWRlL2xpbnV4L3NjYXR0ZXJsaXN0LmgKaW5kZXggN2Zm
OWQ2Mzg2YzEyLi4zNzVhNWU5MGQ4NmEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvc2NhdHRl
cmxpc3QuaAorKysgYi9pbmNsdWRlL2xpbnV4L3NjYXR0ZXJsaXN0LmgKQEAgLTE2LDYgKzE2LDkg
QEAgc3RydWN0IHNjYXR0ZXJsaXN0IHsKICNpZmRlZiBDT05GSUdfTkVFRF9TR19ETUFfTEVOR1RI
CiAJdW5zaWduZWQgaW50CWRtYV9sZW5ndGg7CiAjZW5kaWYKKyNpZmRlZiBDT05GSUdfUENJX1Ay
UERNQQorCXVuc2lnbmVkIGludCAgICBkbWFfZmxhZ3M7CisjZW5kaWYKIH07CiAKIC8qCkBAIC0y
NDUsNiArMjQ4LDcyIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzZ191bm1hcmtfZW5kKHN0cnVjdCBz
Y2F0dGVybGlzdCAqc2cpCiAJc2ctPnBhZ2VfbGluayAmPSB+U0dfRU5EOwogfQogCisvKgorICog
Q09ORkdJX1BDSV9QMlBETUEgZGVwZW5kcyBvbiBDT05GSUdfNjRCSVQgd2hpY2ggbWVhbnMgdGhl
cmUgaXMgNCBieXRlcworICogaW4gc3RydWN0IHNjYXR0ZXJsaXN0IChhc3N1bWluZyBhbHNvIENP
TkZJR19ORUVEX1NHX0RNQV9MRU5HVEggaXMgc2V0KS4KKyAqIFVzZSB0aGlzIHBhZGRpbmcgZm9y
IERNQSBmbGFncyBiaXRzIHRvIGluZGljYXRlIHdoZW4gYSBzcGVjaWZpYworICogZG1hIGFkZHJl
c3MgaXMgYSBidXMgYWRkcmVzcy4KKyAqLworI2lmZGVmIENPTkZJR19QQ0lfUDJQRE1BCisKKyNk
ZWZpbmUgU0dfRE1BX0JVU19BRERSRVNTICgxIDw8IDApCisKKy8qKgorICogc2dfZG1hX2lzX2J1
cyBhZGRyZXNzIC0gUmV0dXJuIHdoZXRoZXIgYSBnaXZlbiBzZWdtZW50IHdhcyBtYXJrZWQKKyAq
CQkJICAgYXMgYSBidXMgYWRkcmVzcworICogQHNnOgkJIFNHIGVudHJ5CisgKgorICogRGVzY3Jp
cHRpb246CisgKiAgIFJldHVybnMgdHJ1ZSBpZiBzZ19kbWFfbWFya19idXNfYWRkcmVzcygpIGhh
cyBiZWVuIGNhbGxlZCBvbgorICogICB0aGlzIHNlZ21lbnQuCisgKiovCitzdGF0aWMgaW5saW5l
IGJvb2wgc2dfaXNfZG1hX2J1c19hZGRyZXNzKHN0cnVjdCBzY2F0dGVybGlzdCAqc2cpCit7CisJ
cmV0dXJuIHNnLT5kbWFfZmxhZ3MgJiBTR19ETUFfQlVTX0FERFJFU1M7Cit9CisKKy8qKgorICog
c2dfZG1hX21hcmtfYnVzIGFkZHJlc3MgLSBNYXJrIHRoZSBzY2F0dGVybGlzdCBlbnRyeSBhcyBh
IGJ1cyBhZGRyZXNzCisgKiBAc2c6CQkgU0cgZW50cnkKKyAqCisgKiBEZXNjcmlwdGlvbjoKKyAq
ICAgTWFya3MgdGhlIHBhc3NlZCBpbiBzZyBlbnRyeSB0byBpbmRpY2F0ZSB0aGF0IHRoZSBkbWFf
YWRkcmVzcyBpcworICogICBhIGJ1cyBhZGRyZXNzIGFuZCBkb2Vzbid0IG5lZWQgdG8gYmUgdW5t
YXBwZWQuIFRoaXMgc2hvdWxkIG9ubHkgYmUKKyAqICAgdXNlZCBieSBkbWFfbWFwX3NnKCkgaW1w
bGVtZW50YXRpb25zIHRvIG1hcmsgYnVzIGFkZHJlc3NlcworICogICBzbyB0aGV5IGNhbiBiZSBw
cm9wZXJseSBjbGVhbmVkIHVwIGluIGRtYV91bm1hcF9zZygpLgorICoqLworc3RhdGljIGlubGlu
ZSB2b2lkIHNnX2RtYV9tYXJrX2J1c19hZGRyZXNzKHN0cnVjdCBzY2F0dGVybGlzdCAqc2cpCit7
CisJc2ctPmRtYV9mbGFncyB8PSBTR19ETUFfQlVTX0FERFJFU1M7Cit9CisKKy8qKgorICogc2df
dW5tYXJrX2J1c19hZGRyZXNzIC0gVW5tYXJrIHRoZSBzY2F0dGVybGlzdCBlbnRyeSBhcyBhIGJ1
cyBhZGRyZXNzCisgKiBAc2c6CQkgU0cgZW50cnkKKyAqCisgKiBEZXNjcmlwdGlvbjoKKyAqICAg
Q2xlYXJzIHRoZSBidXMgYWRkcmVzcyBtYXJrLgorICoqLworc3RhdGljIGlubGluZSB2b2lkIHNn
X2RtYV91bm1hcmtfYnVzX2FkZHJlc3Moc3RydWN0IHNjYXR0ZXJsaXN0ICpzZykKK3sKKwlzZy0+
ZG1hX2ZsYWdzICY9IH5TR19ETUFfQlVTX0FERFJFU1M7Cit9CisKKyNlbHNlCisKK3N0YXRpYyBp
bmxpbmUgYm9vbCBzZ19pc19kbWFfYnVzX2FkZHJlc3Moc3RydWN0IHNjYXR0ZXJsaXN0ICpzZykK
K3sKKwlyZXR1cm4gZmFsc2U7Cit9CitzdGF0aWMgaW5saW5lIHZvaWQgc2dfZG1hX21hcmtfYnVz
X2FkZHJlc3Moc3RydWN0IHNjYXR0ZXJsaXN0ICpzZykKK3sKK30KK3N0YXRpYyBpbmxpbmUgdm9p
ZCBzZ19kbWFfdW5tYXJrX2J1c19hZGRyZXNzKHN0cnVjdCBzY2F0dGVybGlzdCAqc2cpCit7Cit9
CisKKyNlbmRpZgorCiAvKioKICAqIHNnX3BoeXMgLSBSZXR1cm4gcGh5c2ljYWwgYWRkcmVzcyBv
ZiBhbiBzZyBlbnRyeQogICogQHNnOgkgICAgIFNHIGVudHJ5Ci0tIAoyLjMwLjIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlz
dAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
