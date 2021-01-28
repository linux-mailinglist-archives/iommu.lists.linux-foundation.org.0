Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AD730794F
	for <lists.iommu@lfdr.de>; Thu, 28 Jan 2021 16:18:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 605E8868A9;
	Thu, 28 Jan 2021 15:18:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IquwN3F13CkK; Thu, 28 Jan 2021 15:18:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C288E868AF;
	Thu, 28 Jan 2021 15:18:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ACF1BC013A;
	Thu, 28 Jan 2021 15:18:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A0A5C013A
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 15:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F1F822E0DD
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 15:18:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 34AizszSfP-H for <iommu@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 15:18:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by silver.osuosl.org (Postfix) with ESMTPS id D7D4721503
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 15:18:05 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DRPFQ4vV3zlC5j;
 Thu, 28 Jan 2021 23:16:26 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.184.42) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Thu, 28 Jan 2021 23:17:53 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <kvm@vger.kernel.org>, <kvmarm@lists.cs.columbia.edu>,
 <iommu@lists.linux-foundation.org>, Will Deacon <will@kernel.org>, "Alex
 Williamson" <alex.williamson@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>
Subject: [RFC PATCH 00/11] vfio/iommu_type1: Implement dirty log tracking
 based on smmuv3 HTTU
Date: Thu, 28 Jan 2021 23:17:31 +0800
Message-ID: <20210128151742.18840-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Cc: Mark Rutland <mark.rutland@arm.com>, jiangkunkun@huawei.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Cornelia Huck <cohuck@redhat.com>,
 lushenming@huawei.com, Kirti Wankhede <kwankhede@nvidia.com>,
 James Morse <james.morse@arm.com>, wanghaibin.wang@huawei.com,
 Robin Murphy <robin.murphy@arm.com>
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

SGkgYWxsLAoKVGhpcyBwYXRjaCBzZXJpZXMgaW1wbGVtZW50IGEgbmV3IGRpcnR5IGxvZyB0cmFj
a2luZyBtZXRob2QgZm9yIHZmaW8gZG1hLgoKSW50ZW50aW9u77yaCgpBcyB3ZSBrbm93LCB2Zmlv
IGxpdmUgbWlncmF0aW9uIGlzIGFuIGltcG9ydGFudCBhbmQgdmFsdWFibGUgZmVhdHVyZSwgYnV0
IHRoZXJlCmFyZSBzdGlsbCBtYW55IGh1cmRsZXMgdG8gc29sdmUsIGluY2x1ZGluZyBtaWdyYXRp
b24gb2YgaW50ZXJydXB0LCBkZXZpY2Ugc3RhdGUsCkRNQSBkaXJ0eSBsb2cgdHJhY2tpbmcsIGFu
ZCBldGMuCgpGb3Igbm93LCB0aGUgb25seSBkaXJ0eSBsb2cgdHJhY2tpbmcgaW50ZXJmYWNlIGlz
IHBpbm5pbmcuIEl0IGhhcyBzb21lIGRyYXdiYWNrczoKMS4gT25seSBzbWFydCB2ZW5kb3IgZHJp
dmVycyBhcmUgYXdhcmUgb2YgdGhpcy4KMi4gSXQncyBjb2Fyc2UtZ3JhaW5lZCwgdGhlIHBpbm5l
ZC1zY29wZSBpcyBnZW5lcmFsbHkgYmlnZ2VyIHRoYW4gd2hhdCB0aGUgZGV2aWNlIGFjdHVhbGx5
IGFjY2Vzcy4KMy4gSXQgY2FuJ3QgdHJhY2sgZGlydHkgY29udGludW91c2x5IGFuZCBwcmVjaXNl
bHksIHZmaW8gcG9wdWxhdGVzIGFsbCBwaW5uZWQtc2NvcGUgYXMgZGlydHkuCiAgIFNvIGl0IGRv
ZXNuJ3Qgd29yayB3ZWxsIHdpdGggaXRlcmF0aXZlbHkgZGlydHkgbG9nIGhhbmRsaW5nLgoKQWJv
dXQgU01NVSBIVFRVOgoKSFRUVSAoSGFyZHdhcmUgVHJhbnNsYXRpb24gVGFibGUgVXBkYXRlKSBp
cyBhIGZlYXR1cmUgb2YgQVJNIFNNTVV2MywgaXQgY2FuIHVwZGF0ZQphY2Nlc3MgZmxhZyBvci9h
bmQgZGlydHkgc3RhdGUgb2YgdGhlIFRURCAoVHJhbnNsYXRpb24gVGFibGUgRGVzY3JpcHRvcikg
YnkgaGFyZHdhcmUuCldpdGggSFRUVSwgc3RhZ2UxIFRURCBpcyBjbGFzc2lmaWVkIGludG8gMyB0
eXBlczoKICAgICAgICAgICAgICAgICAgICAgICAgREJNIGJpdCAgICAgICAgICAgICBBUFsyXShy
ZWFkb25seSBiaXQpCjEuIHdyaXRhYmxlX2NsZWFuICAgICAgICAgMSAgICAgICAgICAgICAgICAg
ICAgICAgMQoyLiB3cml0YWJsZV9kaXJ0eSAgICAgICAgIDEgICAgICAgICAgICAgICAgICAgICAg
IDAKMy4gcmVhZG9ubHkgICAgICAgICAgICAgICAwICAgICAgICAgICAgICAgICAgICAgICAxCgpJ
ZiBIVFRVX0hEIChtYW5hZ2UgZGlydHkgc3RhdGUpIGlzIGVuYWJsZWQsIHNtbXUgY2FuIGNoYW5n
ZSBUVEQgZnJvbSB3cml0YWJsZV9jbGVhbiB0bwp3cml0YWJsZV9kaXJ0eS4gVGhlbiBzb2Z0d2Fy
ZSBjYW4gc2NhbiBUVEQgdG8gc3luYyBkaXJ0eSBzdGF0ZSBpbnRvIGRpcnR5IGJpdG1hcC4gV2l0
aAp0aGlzIGZlYXR1cmUsIHdlIGNhbiB0cmFjayB0aGUgZGlydHkgbG9nIG9mIERNQSBjb250aW51
b3VzbHkgYW5kIHByZWNpc2VseS4KCkFib3V0IHRoaXMgc2VyaWVzOgoKUGF0Y2ggMS0zOiBBZGQg
ZmVhdHVyZSBkZXRlY3Rpb24gZm9yIHNtbXUgSFRUVSBhbmQgZW5hYmxlIEhUVFUgZm9yIHNtbXUg
c3RhZ2UxIG1hcHBpbmcuCiAgICAgICAgICAgQW5kIGFkZCBmZWF0dXJlIGRldGVjdGlvbiBmb3Ig
c21tdSBCQk1MLiBXZSBuZWVkIHRvIHNwbGl0IGJsb2NrIG1hcHBpbmcgd2hlbgogICAgICAgICAg
IHN0YXJ0IGRpcnR5IGxvZyB0cmFja2luZyBhbmQgbWVyZ2UgcGFnZSBtYXBwaW5nIHdoZW4gc3Rv
cCBkaXJ0eSBsb2cgdHJhY2tpbmcsCgkJICAgd2hpY2ggcmVxdWlyZXMgYnJlYWstYmVmb3JlLW1h
a2UgcHJvY2VkdXJlLiBCdXQgaXQgbWlnaHQgY2F1c2UgcHJvYmxlbXMgd2hlbiB0aGUKCQkgICBU
VEQgaXMgYWxpdmUuIFRoZSBJL08gc3RyZWFtcyBtaWdodCBub3QgdG9sZXJhdGUgdHJhbnNsYXRp
b24gZmF1bHRzLiBTbyBCQk1MCgkJICAgc2hvdWxkIGJlIHVzZWQuCgpQYXRjaCA0LTc6IEFkZCBm
b3VyIGludGVyZmFjZXMgKHNwbGl0X2Jsb2NrLCBtZXJnZV9wYWdlLCBzeW5jX2RpcnR5X2xvZyBh
bmQgY2xlYXJfZGlydHlfbG9nKQogICAgICAgICAgIGluIElPTU1VIGxheWVyLCB0aGV5IGFyZSBl
c3NlbnRpYWwgdG8gaW1wbGVtZW50IGRtYSBkaXJ0eSBsb2cgdHJhY2tpbmcgZm9yIHZmaW8uCgkJ
ICAgV2UgaW1wbGVtZW50IHRoZXNlIGludGVyZmFjZXMgZm9yIGFybSBzbW11djMuCgpQYXRjaCAg
IDg6IEFkZCBIV0RCTSAoSGFyZHdhcmUgRGlydHkgQml0IE1hbmFnZW1lbnQpIGRldmljZSBmZWF0
dXJlIHJlcG9ydGluZyBpbiBJT01NVSBsYXllci4KClBhdGNoOS0xMTogSW1wbGVtZW50IGEgbmV3
IGRpcnR5IGxvZyB0cmFja2luZyBtZXRob2QgZm9yIHZmaW8gYmFzZWQgb24gaW9tbXUgaHdkYm0u
IEEgbmV3CiAgICAgICAgICAgaW9jdGwgb3BlcmF0aW9uIG5hbWVkIFZGSU9fRElSVFlfTE9HX01B
TlVBTF9DTEVBUiBpcyBhZGRlZCwgd2hpY2ggY2FuIGVsaW1pbmF0ZQoJCSAgIHNvbWUgcmVkdW5k
YW50IGRpcnR5IGhhbmRsaW5nIG9mIHVzZXJzcGFjZS4KCk9wdGltaXphdGlvbnMgVE8gRG86Cgox
LiBXZSByZWNvZ25pemVkIHRoYXQgZWFjaCBzbW11X2RvbWFpbiAoYSB2ZmlvX2NvbnRhaW5lciBt
YXkgaGFzIHNldmVyYWwgc21tdV9kb21haW4pIGhhcyBpdHMKICAgb3duIHN0YWdlMSBtYXBwaW5n
LCBhbmQgd2UgbXVzdCBzY2FuIGFsbCB0aGVzZSBtYXBwaW5nIHRvIHN5bmMgZGlydHkgc3RhdGUu
IFdlIHBsYW4gdG8gcmVmYWN0b3IKICAgc21tdV9kb21haW4gdG8gc3VwcG9ydCBtb3JlIHRoYW4g
b25lIHNtbXUgaW4gb25lIHNtbXVfZG9tYWluLCB0aGVuIHRoZXNlIHNtbXVzIGNhbiBzaGFyZSBh
IHNhbWUKICAgc3RhZ2UxIG1hcHBpbmcuCjIuIFdlIGFsc28gcmVjb2duaXplZCB0aGF0IHNjYW4g
VFREIGlzIGEgaG90c3BvdCBvZiBwZXJmb3JtYW5jZS4gUmVjZW50bHksIEkgaGF2ZSBpbXBsZW1l
bnQgYQogICBTVy9IVyBjb25iaW5lZCBkaXJ0eSBsb2cgdHJhY2tpbmcgYXQgTU1VIHNpZGUgWzFd
LCB3aGljaCBjYW4gZWZmZWN0aXZlbHkgc29sdmUgdGhpcyBwcm9ibGVtLgogICBUaGlzIGlkZWEg
Y2FuIGJlIGFwcGxpZWQgdG8gc21tdSBzaWRlIHRvby4KClRoYW5rcywKS2VxaWFuCgoKWzFdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAyMTAxMjYxMjQ0NDQuMjcx
MzYtMS16aHVrZXFpYW4xQGh1YXdlaS5jb20vCgpqaWFuZ2t1bmt1biAoMTEpOgogIGlvbW11L2Fy
bS1zbW11LXYzOiBBZGQgZmVhdHVyZSBkZXRlY3Rpb24gZm9yIEhUVFUKICBpb21tdS9hcm0tc21t
dS12MzogRW5hYmxlIEhUVFUgZm9yIFNNTVUgc3RhZ2UxIG1hcHBpbmcKICBpb21tdS9hcm0tc21t
dS12MzogQWRkIGZlYXR1cmUgZGV0ZWN0aW9uIGZvciBCQk1MCiAgaW9tbXUvYXJtLXNtbXUtdjM6
IFNwbGl0IGJsb2NrIGRlc2NyaXB0b3IgdG8gYSBzcGFuIG9mIHBhZ2UKICBpb21tdS9hcm0tc21t
dS12MzogTWVyZ2UgYSBzcGFuIG9mIHBhZ2UgdG8gYmxvY2sgZGVzY3JpcHRvcgogIGlvbW11L2Fy
bS1zbW11LXYzOiBTY2FuIGxlYWYgVFREIHRvIHN5bmMgaGFyZHdhcmUgZGlydHkgbG9nCiAgaW9t
bXUvYXJtLXNtbXUtdjM6IENsZWFyIGRpcnR5IGxvZyBhY2NvcmRpbmcgdG8gYml0bWFwCiAgaW9t
bXUvYXJtLXNtbXUtdjM6IEFkZCBIV0RCTSBkZXZpY2UgZmVhdHVyZSByZXBvcnRpbmcKICB2Zmlv
L2lvbW11X3R5cGUxOiBBZGQgSFdEQk0gc3RhdHVzIG1haW50YW5hbmNlCiAgdmZpby9pb21tdV90
eXBlMTogT3B0aW1pemUgZGlydHkgYml0bWFwIHBvcHVsYXRpb24gYmFzZWQgb24gaW9tbXUKICAg
IEhXREJNCiAgdmZpby9pb21tdV90eXBlMTogQWRkIHN1cHBvcnQgZm9yIG1hbnVhbCBkaXJ0eSBs
b2cgY2xlYXIKCiBkcml2ZXJzL2lvbW11L2FybS9hcm0tc21tdS12My9hcm0tc21tdS12My5jIHwg
MTM4ICsrKysrKy0KIGRyaXZlcnMvaW9tbXUvYXJtL2FybS1zbW11LXYzL2FybS1zbW11LXYzLmgg
fCAgMTQgKwogZHJpdmVycy9pb21tdS9pby1wZ3RhYmxlLWFybS5jICAgICAgICAgICAgICB8IDM5
MiArKysrKysrKysrKysrKysrKysrLQogZHJpdmVycy9pb21tdS9pb21tdS5jICAgICAgICAgICAg
ICAgICAgICAgICB8IDIyNyArKysrKysrKysrKysKIGRyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5
cGUxLmMgICAgICAgICAgICAgfCAyMzUgKysrKysrKysrKystCiBpbmNsdWRlL2xpbnV4L2lvLXBn
dGFibGUuaCAgICAgICAgICAgICAgICAgIHwgIDE0ICsKIGluY2x1ZGUvbGludXgvaW9tbXUuaCAg
ICAgICAgICAgICAgICAgICAgICAgfCAgNTUgKysrCiBpbmNsdWRlL3VhcGkvbGludXgvdmZpby5o
ICAgICAgICAgICAgICAgICAgIHwgIDI4ICstCiA4IGZpbGVzIGNoYW5nZWQsIDEwOTMgaW5zZXJ0
aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vaW9tbXU=
