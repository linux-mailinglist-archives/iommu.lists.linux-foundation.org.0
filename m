Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EBF32711C
	for <lists.iommu@lfdr.de>; Sun, 28 Feb 2021 07:33:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB4794F07D;
	Sun, 28 Feb 2021 06:33:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id djNiqsvjZF2v; Sun, 28 Feb 2021 06:33:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DF454F0BC;
	Sun, 28 Feb 2021 06:33:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4276C000E;
	Sun, 28 Feb 2021 06:33:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B473C000E
 for <iommu@lists.linux-foundation.org>; Sun, 28 Feb 2021 06:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69A2341468
 for <iommu@lists.linux-foundation.org>; Sun, 28 Feb 2021 06:33:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Fq-KcdJh3kf for <iommu@lists.linux-foundation.org>;
 Sun, 28 Feb 2021 06:33:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5ACF43150
 for <iommu@lists.linux-foundation.org>; Sun, 28 Feb 2021 06:33:12 +0000 (UTC)
IronPort-SDR: CyQ7yigQ212tG6avFdMi1UGiXHrAbudUqbZhnOzBbOXsRm64FPDRpXN27GCo8OyaVa0gYrgI3k
 73L2zbRPq0nw==
X-IronPort-AV: E=McAfee;i="6000,8403,9908"; a="247624819"
X-IronPort-AV: E=Sophos;i="5.81,211,1610438400"; d="scan'208";a="247624819"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2021 22:33:10 -0800
IronPort-SDR: +T9STUHvLgHVslt36fIQ9N1GTV3VmJPU6OiRU8iSdNDzlrfPpN5eh7OC/N9+5nDbwaEX2Eb53X
 +8ZVL72C19YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,211,1610438400"; d="scan'208";a="517029746"
Received: from otc-wp-03.jf.intel.com ([10.54.39.79])
 by orsmga004.jf.intel.com with ESMTP; 27 Feb 2021 22:33:10 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: LKML <linux-kernel@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 "Lu Baolu" <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux-foundation.org,
 cgroups@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Li Zefan <lizefan@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>
Subject: [RFC PATCH 17/18] docs: cgroup-v1: Add IOASIDs controller
Date: Sat, 27 Feb 2021 14:01:25 -0800
Message-Id: <1614463286-97618-18-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614463286-97618-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1614463286-97618-1-git-send-email-jacob.jun.pan@linux.intel.com>
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Raj Ashok <ashok.raj@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Wu Hao <hao.wu@intel.com>
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

U2lnbmVkLW9mZi1ieTogSmFjb2IgUGFuIDxqYWNvYi5qdW4ucGFuQGxpbnV4LmludGVsLmNvbT4K
LS0tCiBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2Nncm91cC12MS9pbmRleC5yc3QgfCAgIDEg
KwogLi4uL2FkbWluLWd1aWRlL2Nncm91cC12MS9pb2FzaWRzLnJzdCAgICAgICAgIHwgMTEwICsr
KysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMTEgaW5zZXJ0aW9ucygrKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvY2dyb3VwLXYxL2lvYXNp
ZHMucnN0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9jZ3JvdXAtdjEv
aW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9jZ3JvdXAtdjEvaW5kZXgucnN0
CmluZGV4IDIyNmY2NDQ3M2U4ZS4uZjVlMzA3ZGM0ZGJiIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL2Nncm91cC12MS9pbmRleC5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9h
ZG1pbi1ndWlkZS9jZ3JvdXAtdjEvaW5kZXgucnN0CkBAIC0xNSw2ICsxNSw3IEBAIENvbnRyb2wg
R3JvdXBzIHZlcnNpb24gMQogICAgIGRldmljZXMKICAgICBmcmVlemVyLXN1YnN5c3RlbQogICAg
IGh1Z2V0bGIKKyAgICBpb2FzaWRzCiAgICAgbWVtY2dfdGVzdAogICAgIG1lbW9yeQogICAgIG5l
dF9jbHMKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvY2dyb3VwLXYxL2lv
YXNpZHMucnN0IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9jZ3JvdXAtdjEvaW9hc2lkcy5y
c3QKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5iMzBlYjQxYmYxYmUK
LS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2Nncm91cC12MS9p
b2FzaWRzLnJzdApAQCAtMCwwICsxLDExMCBAQAorPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQorSS9PIEFkZHJlc3MgU3BhY2UgSUQgKElPQVNJRCkgQ29udHJvbGxlcgor
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQorCitBY3JvbnltcworLS0t
LS0tLS0KK1BBU0lEOgorCVByb2Nlc3MgQWRkcmVzcyBTcGFjZSBJRCwgZGVmaW5lZCBieSBQQ0ll
CitTVkE6CisJU2hhcmVkIFZpcnR1YWwgQWRkcmVzcworCitJbnRyb2R1Y3Rpb24KKy0tLS0tLS0t
LS0tLQorCitJT0FTSURzIGFyZSB1c2VkIHRvIGFzc29jaWF0ZSBETUEgcmVxdWVzdHMgd2l0aCB2
aXJ0dWFsIGFkZHJlc3Mgc3BhY2VzLiBBcworYSBzeXN0ZW0td2lkZSBsaW1pdGVkwrkgcmVzb3Vy
Y2UsIGl0cyBjb25zdHJhaW50cyBhcmUgbWFuYWdlZCBieSB0aGUgSU9BU0lEcworY2dyb3VwIHN1
YnN5c3RlbS4gVGhlIHNwZWNpZmljIHVzZSBjYXNlcyBhcmU6CisKKzEuIFNvbWUgdXNlciBhcHBs
aWNhdGlvbnMgZXhoYXVzdCBhbGwgdGhlIGF2YWlsYWJsZSBJT0FTSURzIHRodXMgZGVwcml2aW5n
CisgICBvdGhlcnMgb2YgdGhlIHNhbWUgaG9zdC4KKworMi4gU3lzdGVtIGFkbWlucyBuZWVkIHRv
IHByb3Zpc2lvbiBWTXMgYmFzZWQgb24gdGhlaXIgbmVlZHMgZm9yIElPQVNJRHMsCisgICBlLmcu
IHRoZSBudW1iZXIgb2YgVk1zIHdpdGggYXNzaWduZWQgZGV2aWNlcyB0aGF0IHBlcmZvcm0gRE1B
IHJlcXVlc3RzCisgICB3aXRoIFBBU0lELgorCitUaGUgSU9BU0lEIHN1YnN5c3RlbSBjb25zaXN0
cyBvZiB0aHJlZSBjb21wb25lbnRzOgorCistIElPQVNJRCBjb3JlOiBwcm92aWRlcyBBUElzIGZv
ciBhbGxvY2F0aW9uLCBwb29sIG1hbmFnZW1lbnQsCisgIG5vdGlmaWNhdGlvbnMgYW5kIHJlZmNv
dW50aW5nLiBTZWUgRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2lvYXNpZC5yc3QKKyAgZm9yIGRl
dGFpbHMKKy0gSU9BU0lEIHVzZXI6ICBwcm92aWRlcyB1c2VyIGFsbG9jYXRpb24gaW50ZXJmYWNl
IHZpYSAvZGV2L2lvYXNpZAorLSBJT0FTSUQgY2dyb3VwIGNvbnRyb2xsZXI6IG1hbmFnZSByZXNv
dXJjZSBkaXN0cmlidXRpb24KKworUmVzb3VyY2UgRGlzdHJpYnV0aW9uIE1vZGVsCistLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KK0lPQVNJRCBhbGxvY2F0aW9uIGlzIHByb2Nlc3MtYmFzZWQg
aW4gdGhhdCBJT0FTSURzIGFyZSB0aWVkIHRvIHBhZ2UgdGFibGVzwrIsCit0aGUgdGhyZWFkZWQg
bW9kZWwgaXMgbm90IHN1cHBvcnRlZC4gVGhlIGFsbG9jYXRpb24gaXMgcmVqZWN0ZWQgYnkgdGhl
CitjZ3JvdXAgaGllcmFyY2h5IG9uY2UgYSBsaW1pdCBpcyByZWFjaGVkLiBIb3dldmVyLCBvcmdh
bml6YXRpb25hbCBjaGFuZ2VzCitzdWNoIGFzIG1vdmluZyBwcm9jZXNzZXMgYWNyb3NzIGNncm91
cHMgYXJlIGV4ZW1wdGVkLiBUaGVyZWZvcmUsIGl0IGlzCitwb3NzaWJsZSB0byBoYXZlIGlvYXNp
ZHMuY3VycmVudCA+IGlvYXNpZHMubWF4LiBJdCBpcyBub3QgcG9zc2libGUgdG8gZG8KK2Z1cnRo
ZXIgYWxsb2NhdGlvbiBhZnRlciB0aGUgb3JnYW5pemF0aW9uYWwgY2hhbmdlIHRoYXQgZXhjZWVk
cyB0aGUgbWF4LgorCitUaGUgc3lzdGVtIGNhcGFjaXR5IG9mIHRoZSBJT0FTSURzIGlzIGRlZmF1
bHQgdG8gUENJZSBQQVNJRCBzaXplIG9mIDIwIGJpdHMuCitJT0FTSUQgY29yZSBwcm92aWRlcyBB
UEkgdG8gYWRqdXN0IHRoZSBzeXN0ZW0gY2FwYWNpdHkgYmFzZWQgb24gcGxhdGZvcm1zLgorSU9B
U0lEcyBhcmUgdXNlZCBieSBib3RoIHVzZXIgYXBwbGljYXRpb25zIChlLmcuIFZNcyBhbmQgdXNl
cnNwYWNlIGRyaXZlcnMpCithbmQga2VybmVsIChlLmcuIHN1cGVydmlzb3IgU1ZBKS4gSG93ZXZl
ciwgb25seSB1c2VyIGFsbG9jYXRpb24gaXMgc3ViamVjdAordG8gY2dyb3VwIGNvbnN0cmFpbnRz
LiBIb3N0IGtlcm5lbCBhbGxvY2F0ZXMgYSBwb29sIG9mIElPQVNJRHMgd2hlcmUgaXRzCitxdW90
YSBpcyBzdWJ0cmFjdGVkIGZyb20gdGhlIHN5c3RlbSBjYXBhY2l0eS4gSU9BU0lEcyBjZ3JvdXAg
Y29uc3VsdHMgd2l0aAordGhlIElPQVNJRCBjb3JlIGZvciBhdmFpbGFibGUgY2FwYWNpdHkgd2hl
biBhIG5ldyBjZ3JvdXAgbGltaXQgaXMgZ3JhbnRlZC4KK1Vwb24gY3JlYXRpb24sIG5vIElPQVNJ
RCBhbGxvY2F0aW9uIGlzIGFsbG93ZWQgYnkgdGhlIHVzZXIgcHJvY2Vzc2VzIHdpdGhpbgordGhl
IG5ldyBjZ3JvdXAuCisKK1VzYWdlCistLS0tLQorQ0dyb3VwIGZpbGVzeXN0ZW0gaGFzIHRoZSBm
b2xsb3dpbmcgSU9BU0lEcyBjb250cm9sbGVyIHNwZWNpZmljIGVudHJpZXM6Cis6OgorCisgaW9h
c2lkcy5jdXJyZW50CisgaW9hc2lkcy5ldmVudHMKKyBpb2FzaWRzLm1heAorCitUbyB1c2UgdGhl
IElPQVNJRHMgY29udHJvbGxlciwgc2V0IGlvYXNpZHMubWF4IHRvIHRoZSBsaW1pdCBvZiB0aGUg
bnVtYmVyCitvZiBJT0FTSURzIHRoYXQgY2FuIGJlIGFsbG9jYXRlZC4gVGhlIGZpbGUgaW9hc2lk
cy5jdXJyZW50IHNob3dzIHRoZSBjdXJyZW50CitudW1iZXIgb2YgSU9BU0lEcyBhbGxvY2F0ZWQg
d2l0aGluIHRoZSBjZ3JvdXAuCisKK0V4YW1wbGUKKy0tLS0tLS0tCisxLiBNb3VudCB0aGUgY2dy
b3VwMiBGUyA6OgorCisJJCBtb3VudCAtdCBjZ3JvdXAyIG5vbmUgL21udC9jZzIvCisKKzIuIEFk
ZCBpb2FzaWRzIGNvbnRyb2xsZXIgOjoKKworCSQgZWNobyAnK2lvYXNpZHMnID4gL21udC9jZzIv
Y2dyb3VwLnN1YnRyZWVfY29udHJvbAorCiszLiBDcmVhdGUgYSBoaWVyYXJjaHksIHNldCBub24t
emVybyBsaW1pdCAoZGVmYXVsdCAwKSA6OgorCisJJCBta2RpciAvbW50L2NnMi90ZXN0MQorCSQg
ZWNobyA1ID4gL21udC9jZzIvdGVzdDEvaW9hc2lkcy5tYXgKKworNC4gQWxsb2NhdGUgSU9BU0lE
cyB3aXRoaW4gbGltaXQgc2hvdWxkIHN1Y2NlZWQgOjoKKworCSRlY2hvICQkID4gL21udC9jZzIv
dGVzdDEvY2dyb3VwLnByb2NzCisJRG8gSU9BU0lEIGFsbG9jYXRpb24gdmlhIC9kZXYvaW9hc2lk
CisJaW9hc2lkcy5jdXJyZW50OjEKKwlpb2FzaWRzLm1heDo1CisKKzUuIEF0dGVtcHQgdG8gYWxs
b2NhdGUgSU9BU0lEcyBiZXlvbmQgbGltaXQgc2hvdWxkIGZhaWwgOjoKKworCWlvYXNpZHMuY3Vy
cmVudDo1CisJaW9hc2lkcy5tYXg6NQorCis2LiBBdHRhY2ggYSBuZXcgcHJvY2VzcyB3aXRoIElP
QVNJRCBhbHJlYWR5IGFsbG9jYXRlZCB0byBhIGNncm91cCBjb3VsZAorcmVzdWx0IGluIGlvYXNp
ZHMuY3VycmVudCA+IGlvYXNpZHMubWF4LCBlLmcuIHByb2Nlc3Mgd2l0aCBQSUQgMTIzNCB1bmRl
cgorYSBjZ3JvdXAgd2l0aCBJT0FTSURzIGNvbnRyb2xsZXIgaGFzIG9uZSBJT0FTSUQgYWxsb2Nh
dGVkLCBtb3ZpbmcgaXQgdG8KK3Rlc3QxIGNncm91cCA6OgorCisJJGVjaG8gMTIzNCA+IC9tbnQv
Y2cyL3Rlc3QxL2Nncm91cC5wcm9jcworCWlvYXNpZHMuY3VycmVudDo2CisJaW9hc2lkcy5tYXg6
NQorCitOb3RlcworLS0tLS0KK8K5IFdoZW4gSU9BU0lEIGlzIHVzZWQgZm9yIFBDSSBFeHByZXNz
IFBBU0lELCB0aGUgcmFuZ2UgaXMgbGltaXRlZCB0byB0aGUKK1BBU0lEIHNpemUgb2YgMjAgYml0
cy4gRm9yIGEgZGV2aWNlIHRoYXQgaXRzIHJlc291cmNlcyBjYW4gYmUgc2hhcmVkIGFjcm9zcwor
dGhlIHBsYXRmb3JtLCB0aGUgSU9BU0lEIG5hbWVzcGFjZSBtdXN0IGJlIHN5c3RlbS13aWRlIGlu
IG9yZGVyIHRvIHVuaXF1ZWx5CitpZGVudGlmeSBETUEgcmVxdWVzdCB3aXRoIFBBU0lEIGluc2lk
ZSB0aGUgZGV2aWNlLgorCivCsiBUaGUgcHJpbWFyeSB1c2UgY2FzZSBpcyBTVkEsIHdoZXJlIENQ
VSBwYWdlIHRhYmxlcyBhcmUgc2hhcmVkIHdpdGggRE1BIHZpYQorSU9NTVUuCi0tIAoyLjI1LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1h
aWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
