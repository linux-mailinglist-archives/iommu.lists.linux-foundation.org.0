Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0FC2B9226
	for <lists.iommu@lfdr.de>; Thu, 19 Nov 2020 13:12:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DDDE386DB7;
	Thu, 19 Nov 2020 12:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tdpO8sZw6Khk; Thu, 19 Nov 2020 12:12:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 19B9086DB1;
	Thu, 19 Nov 2020 12:12:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E845EC0891;
	Thu, 19 Nov 2020 12:12:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70C95C0891
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 12:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 545C586DB1
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 12:12:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ENCJ6+7vBpni for <iommu@lists.linux-foundation.org>;
 Thu, 19 Nov 2020 12:12:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BEEE086D8B
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 12:12:35 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CcJTC4TQMz709F;
 Thu, 19 Nov 2020 20:12:15 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.210.168.73) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Thu, 19 Nov 2020 20:12:20 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-acpi@vger.kernel.org>,
 <iommu@lists.linux-foundation.org>, <devel@acpica.org>
Subject: [RFC PATCH v2 0/8] ACPI/IORT: Support for IORT RMR node
Date: Thu, 19 Nov 2020 12:11:42 +0000
Message-ID: <20201119121150.3316-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.210.168.73]
X-CFilter-Loop: Reflected
Cc: linuxarm@huawei.com, steven.price@arm.com, guohanjun@huawei.com,
 Sami.Mujawar@arm.com, robin.murphy@arm.com, wanghuiqiang@huawei.com
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

UkZDIHYxIC0tPiB2MjoKwqAtIEFkZGVkIGEgZ2VuZXJpYyBpbnRlcmZhY2UgZm9yIElPTU1VIGRy
aXZlcnMgdG8gcmV0cmlldmUgYWxsIHRoZSAKwqAgwqBSTVIgaW5mbyBhc3NvY2lhdGVkIHdpdGgg
YSBnaXZlbiBJT01NVS4KwqAtIFNNTVV2MyBkcml2ZXIgZ2V0cyB0aGUgUk1SIGxpc3QgZHVyaW5n
IHByb2JlKCkgYW5kIGluc3RhbGxzCsKgwqAgYnlwYXNzIFNURXMgZm9yIGFsbCB0aGUgU0lEcyBp
biB0aGUgUk1SIGxpc3QuIFRoaXMgaXMgdG8ga2VlcAogwqAgdGhlIG9uZ29pbmcgdHJhZmZpYyBh
bGl2ZShpZiBhbnkpIGR1cmluZyBTTU1VdjMgcmVzZXQuIFRoaXMgaXMKICAgYmFzZWQgb24gdGhl
IHN1Z2dlc3Rpb25zIHJlY2VpdmVkIGZvciB2MSB0byB0YWtlIGNhcmUgb2YgdGhlCiAgIEVGSSBm
cmFtZWJ1ZmZlciB1c2UgY2FzZS4gT25seSBzYW5pdHkgdGVzdGVkIGZvciBub3cuCsKgLSBEdXJp
bmcgdGhlIHByb2JlL2F0dGFjaCBkZXZpY2UsIFNNTVV2MyBkcml2ZXIgcmVzZXJ2ZXMgYW55CsKg
IMKgUk1SIHJlZ2lvbiBhc3NvY2lhdGVkIHdpdGggdGhlIGRldmljZSBzdWNoIHRoYXQgdGhlcmUg
aXMgYSB1bml0eQrCoCDCoG1hcHBpbmcgZm9yIHRoZW0gaW4gU01NVS4KLS0twqAgwqDCoAoKVGhl
IHNlcmllcyBhZGRzIHN1cHBvcnQgdG8gSU9SVCBSTVIgbm9kZXMgc3BlY2lmaWVkIGluIElPUlQK
UmV2aXNpb24gRSAtQVJNIERFTiAwMDQ5RVswXS4gUk1SIG5vZGVzIGFyZSB1c2VkIHRvIGRlc2Ny
aWJlIG1lbW9yeQpyYW5nZXMgdGhhdCBhcmUgdXNlZCBieSBlbmRwb2ludHMgYW5kIHJlcXVpcmUg
YSB1bml0eSBtYXBwaW5nCmluIFNNTVUuCgpXZSBoYXZlIGZhY2VkIGlzc3VlcyB3aXRoIDM0MDhp
TVIgUkFJRCBjb250cm9sbGVyIGNhcmRzIHdoaWNoCmZhaWwgdG8gYm9vdCB3aGVuIFNNTVUgaXMg
ZW5hYmxlZC4gVGhpcyBpcyBiZWNhdXNlIHRoZXNlIGNvbnRyb2xsZXJzCm1ha2UgdXNlIG9mIGhv
c3QgbWVtb3J5IGZvciB2YXJpb3VzIGNhY2hpbmcgcmVsYXRlZCBwdXJwb3NlcyBhbmQgd2hlbgpT
TU1VIGlzIGVuYWJsZWQgdGhlIGlNUiBmaXJtd2FyZSBmYWlscyB0byBhY2Nlc3MgdGhlc2UgbWVt
b3J5IHJlZ2lvbnMKYXMgdGhlcmUgaXMgbm8gbWFwcGluZyBmb3IgdGhlbS4gSU9SVCBSTVIgcHJv
dmlkZXMgYSB3YXkgZm9yIFVFRkkgdG8KZGVzY3JpYmUgYW5kIHJlcG9ydCB0aGVzZSBtZW1vcnkg
cmVnaW9ucyBzbyB0aGF0IHRoZSBrZXJuZWwgY2FuIG1ha2UKYSB1bml0eSBtYXBwaW5nIGZvciB0
aGVzZSBpbiBTTU1VLgoKUkZDIGJlY2F1c2UsIFBhdGNoICMxIGlzIHRvIHVwZGF0ZSB0aGUgYWN0
YmwyLmggYW5kIHNob3VsZCBiZSBkb25lCnRocm91Z2ggYWNwaWNhIHVwZGF0ZS4gSSBoYXZlIHNl
bmQgb3V0IGEgcHVsbCByZXF1ZXN0WzFdIGZvciB0aGF0LgoKVGVzdHM6CgpXaXRoIGEgVUVGSSwg
dGhhdCByZXBvcnRzIHRoZSBSTVIgZm9yIHRoZSBkZXYsCi4uLi4KWzE2RjBoIDU4NzIgICAxXSAg
ICAgICAgICAgICAgICAgICAgICAgICBUeXBlIDogMDYKWzE2RjFoIDU4NzMgICAyXSAgICAgICAg
ICAgICAgICAgICAgICAgTGVuZ3RoIDogMDA3QwpbMTZGM2ggNTg3NSAgIDFdICAgICAgICAgICAg
ICAgICAgICAgUmV2aXNpb24gOiAwMApbMTAzOGggMDA1NiAgIDJdICAgICAgICAgICAgICAgICAg
ICAgUmVzZXJ2ZWQgOiAwMDAwMDAwMApbMTAzOGggMDA1NiAgIDJdICAgICAgICAgICAgICAgICAg
IElkZW50aWZpZXIgOiAwMDAwMDAwMApbMTZGOGggNTg4MCAgIDRdICAgICAgICAgICAgICAgIE1h
cHBpbmcgQ291bnQgOiAwMDAwMDAwMQpbMTZGQ2ggNTg4NCAgIDRdICAgICAgICAgICAgICAgTWFw
cGluZyBPZmZzZXQgOiAwMDAwMDA0MAoKWzE3MDBoIDU4ODggICA0XSAgICBOdW1iZXIgb2YgUk1S
IERlc2NyaXB0b3JzIDogMDAwMDAwMDIKWzE3MDRoIDU4OTIgICA0XSAgICAgICAgUk1SIERlc2Ny
aXB0b3IgT2Zmc2V0IDogMDAwMDAwMTgKClsxNzA4aCA1ODk2ICAgOF0gICAgICAgICAgQmFzZSBB
ZGRyZXNzIG9mIFJNUiA6IDAwMDBFNjQwMDAwMApbMTcxMGggNTkwNCAgIDhdICAgICAgICAgICAg
ICAgIExlbmd0aCBvZiBSTVIgOiAwMDAwMDAxMDAwMDAKWzE3MThoIDU5MTIgICA0XSAgICAgICAg
ICAgICAgICAgICAgIFJlc2VydmVkIDogMDAwMDAwMDAKClsxNzFDaCA1OTE2ICAgOF0gICAgICAg
ICAgQmFzZSBBZGRyZXNzIG9mIFJNUiA6IDAwMDAwMDAwMjdCMDAwMDAKWzE3MjRoIDU5MjQgICA4
XSAgICAgICAgICAgICAgICBMZW5ndGggb2YgUk1SIDogMDAwMDAwMDAwMEMwMDAwMApbMTcyQ2gg
NTkzMiAgIDRdICAgICAgICAgICAgICAgICAgICAgUmVzZXJ2ZWQgOiAwMDAwMDAwMAoKWzE3MzBo
IDU5MzYgICA0XSAgICAgICAgICAgICAgICAgICBJbnB1dCBiYXNlIDogMDAwMDAwMDAKWzE3MzRo
IDU5NDAgICA0XSAgICAgICAgICAgICAgICAgICAgIElEIENvdW50IDogMDAwMDAwMDEKWzE3Mzho
IDU5NDQgICA0XSAgICAgICAgICAgICAgICAgIE91dHB1dCBCYXNlIDogMDAwMDAwMDMKWzE3M0No
IDU5NDggICA0XSAgICAgICAgICAgICBPdXRwdXQgUmVmZXJlbmNlIDogMDAwMDAwNjQKWzE3NDBo
IDU5NTIgICA0XSAgICAgICAgRmxhZ3MgKGRlY29kZWQgYmVsb3cpIDogMDAwMDAwMDEKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFNpbmdsZSBNYXBwaW5nIDogMQouLi4KCldpdGhvdXQg
dGhlIHNlcmllcyB0aGUgUkFJRCBjb250cm9sbGVyIGluaXRpYWxpemF0aW9uIGZhaWxzIGFzCmJl
bG93LAoKLi4uClsgICAxMi42MzExMTddIG1lZ2FyYWlkX3NhcyAwMDAwOjAzOjAwLjA6IEZXIHN1
cHBvcnRzIHN5bmMgY2FjaGUgICAgICAgIDogWWVzICAgClsgICAxMi42MzczNjBdIG1lZ2FyYWlk
X3NhcyAwMDAwOjAzOjAwLjA6IG1lZ2FzYXNfZGlzYWJsZV9pbnRyX2Z1c2lvbiBpcyBjYWxsZWQg
b3V0Ym91bmRfaW50cl9tYXNrOjB4NDAwMDAwMDkgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAKWyAgIDE4Ljc3NjM3N10gbWVnYXJhaWRfc2FzIDAwMDA6
MDM6MDAuMDogSW5pdCBjbWQgcmV0dXJuIHN0YXR1cyBGQUlMRUQgZm9yIFNDU0kgaG9zdCAwICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIApbICAgMjMuMDE5MzgzXSBtZWdhcmFpZF9zYXMgMDAwMDowMzowMC4wOiBX
YWl0aW5nIGZvciBGVyB0byBjb21lIHRvIHJlYWR5IHN0YXRlIApbICAxMDYuNjg0MjgxXSBtZWdh
cmFpZF9zYXMgMDAwMDowMzowMC4wOiBGVyBpbiBGQVVMVCBzdGF0ZSwgRmF1bHQgY29kZToweDEw
MDAwIHN1YmNvZGU6MHgwIGZ1bmM6bWVnYXNhc190cmFuc2l0aW9uX3RvX3JlYWR5ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgClsgIDEwNi42OTUxODZdIG1lZ2FyYWlkX3NhcyAw
MDAwOjAzOjAwLjA6IFN5c3RlbSBSZWdpc3RlciBzZXQ6ICAgICAgICAgICAgICAgICAgClsgIDEw
Ni44ODk3ODddIG1lZ2FyYWlkX3NhcyAwMDAwOjAzOjAwLjA6IEZhaWxlZCB0byB0cmFuc2l0aW9u
IGNvbnRyb2xsZXIgdG8gcmVhZHkgZm9yIHNjc2kwLiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKWyAgMTA2LjkxMDQ3NV0g
bWVnYXJhaWRfc2FzIDAwMDA6MDM6MDAuMDogRmFpbGVkIGZyb20gbWVnYXNhc19pbml0X2Z3IDY0
MDcgICAgICAKZXN0dWFyeTovJAoKV2l0aCB0aGUgc2VyaWVzLCBub3cgdGhlIGtlcm5lbCBoYXMg
ZGlyZWN0IG1hcHBpbmcgZm9yIHRoZSBkZXYgYXMKYmVsb3csCgplc3R1YXJ5Oi8kIGNhdCAvc3lz
L2tlcm5lbC9pb21tdV9ncm91cHMvMC9yZXNlcnZlZF9yZWdpb25zICAgICAgICAgICAgICAgICAg
ICAgIAoweDAwMDAwMDAwMDgwMDAwMDAgMHgwMDAwMDAwMDA4MGZmZmZmIG1zaSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIAoweDAwMDAwMDAwMjdiMDAwMDAgMHgwMDAwMDAw
MDI4NmZmZmZmIGRpcmVjdCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAoweDAw
MDAwMDAwZTY0MDAwMDAgMHgwMDAwMDAwMGU2NGZmZmZmIGRpcmVjdCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIAplc3R1YXJ5Oi8kCgouLi4uClsgICAxMi4yNTQzMThdIG1lZ2Fy
YWlkX3NhcyAwMDAwOjAzOjAwLjA6IG1lZ2FzYXNfZGlzYWJsZV9pbnRyX2Z1c2lvbiBpcyBjYWxs
ZWQgb3V0Ym91bmRfaW50cl9tYXNrOjB4NDAwMDAwMDkgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAKWyAgIDEyLjczOTA4OV0gbWVnYXJhaWRfc2FzIDAw
MDA6MDM6MDAuMDogRlcgcHJvdmlkZWQgc3VwcG9ydE1heEV4dExEczogMCAgICAgIG1heF9sZHM6
IDMyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIApbICAgMTIuNzQ2NjI4XSBtZWdhcmFpZF9zYXMgMDAwMDowMzowMC4w
OiBjb250cm9sbGVyIHR5cGUgICAgICAgOiBpTVIoME1CKSAgICAgIApbICAgMTIuNzUyNjk0XSBt
ZWdhcmFpZF9zYXMgMDAwMDowMzowMC4wOiBPbmxpbmUgQ29udHJvbGxlciBSZXNldChPQ1IpICA6
IEVuYWJsZWQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClsgICAxMi43NTk3OThdIG1lZ2FyYWlkX3Nh
cyAwMDAwOjAzOjAwLjA6IFNlY3VyZSBKQk9EIHN1cHBvcnQgICA6IFllcyAgICAgICAgICAgClsg
ICAxMi43NjU3NzhdIG1lZ2FyYWlkX3NhcyAwMDAwOjAzOjAwLjA6IE5WTWUgcGFzc3RocnUgc3Vw
cG9ydCA6IFllcyAgICAgICAgICAgClsgICAxMi43NzE5MzFdIG1lZ2FyYWlkX3NhcyAwMDAwOjAz
OjAwLjA6IEZXIHByb3ZpZGVkIFRNIFRhc2tBYm9ydC9SZXNldCB0aW1lb3U6IDYgc2Vjcy82MCBz
ZWNzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAKWyAgIDEyLjc4MDUwM10gbWVnYXJhaWRfc2FzIDAwMDA6MDM6MDAuMDogSkJP
RCBzZXF1ZW5jZSBtYXAgc3VwcG9ydCAgICAgOiBZZXMgICAKWyAgIDEyLjc4NzAwMF0gbWVnYXJh
aWRfc2FzIDAwMDA6MDM6MDAuMDogUENJIExhbmUgTWFyZ2luaW5nIHN1cHBvcnQgICAgOiBObyAg
ICAKWyAgIDEyLjgxOTE3OV0gbWVnYXJhaWRfc2FzIDAwMDA6MDM6MDAuMDogTlZNRSBwYWdlIHNp
emUgICAgICAgIDogKDQwOTYpICAgICAgICAKWyAgIDEyLjgyNTY3Ml0gbWVnYXJhaWRfc2FzIDAw
MDA6MDM6MDAuMDogbWVnYXNhc19lbmFibGVfaW50cl9mdXNpb24gaXMgY2FsbGVkIG91dGJvdW5k
X2ludHJfbWFzazoweDQwMDAwMDAwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIApbICAgMTIuODM1MTk5XSBtZWdhcmFpZF9zYXMgMDAwMDowMzowMC4w
OiBJTklUIGFkYXB0ZXIgZG9uZSAgICAgICAgICAgICAgICAgICAgIApbICAgMTIuODczOTMyXSBt
ZWdhcmFpZF9zYXMgMDAwMDowMzowMC4wOiBwY2kgaWQgICAgICAgICAgICAgICAgOiAoMHgxMDAw
KS8oMHgwMDE3KS8oMHgxOWU1KS8oMHhkMjEzKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClsgICAxMi44ODE2NDRdIG1lZ2FyYWlkX3Nh
cyAwMDAwOjAzOjAwLjA6IHVuZXZlbnNwYW4gc3VwcG9ydCAgICA6IG5vICAgICAgICAgICAgClsg
ICAxMi44ODc0NTFdIG1lZ2FyYWlkX3NhcyAwMDAwOjAzOjAwLjA6IGZpcm13YXJlIGNyYXNoIGR1
bXAgICA6IG5vICAgICAgICAgICAgClsgICAxMi44OTMzNDRdIG1lZ2FyYWlkX3NhcyAwMDAwOjAz
OjAwLjA6IEpCT0Qgc2VxdWVuY2UgbWFwICAgICA6IGVuYWJsZWQgICAgICAgCgpSQUlEIGNvbnRy
b2xsZXIgaW5pdCBpcyBub3cgc3VjY2VzcyBhbmQgY2FuIGRldGVjdCB0aGUgZHJpdmVzCmF0dGFj
aGVkIGFzIHdlbGwuCgpUaGFua3MsClNoYW1lZXIKClswXS4gaHR0cHM6Ly9kZXZlbG9wZXIuYXJt
LmNvbS9kb2N1bWVudGF0aW9uL2RlbjAwNDkvbGF0ZXN0LwpbMV0uIGh0dHBzOi8vZ2l0aHViLmNv
bS9hY3BpY2EvYWNwaWNhL3B1bGwvNjM4CgpTaGFtZWVyIEtvbG90aHVtICg4KToKICBBQ1BJQ0E6
IElPUlQ6IFVwZGF0ZSBmb3IgcmV2aXNpb24gRQogIEFDUEkvSU9SVDogQWRkIHN1cHBvcnQgZm9y
IFJNUiBub2RlIHBhcnNpbmcKICBpb21tdS9kbWE6IEludHJvZHVjZSBnZW5lcmljIGhlbHBlciB0
byByZXRyaWV2ZSBSTVIgaW5mbwogIEFDUEkvSU9SVDogQWRkIFJNUiBtZW1vcnkgcmVnaW9ucyBy
ZXNlcnZhdGlvbiBoZWxwZXIKICBpb21tdS9hcm0tc21tdS12MzogSW50cm9kdWNlIHN0cnRhYiBp
bml0IGhlbHBlcgogIGlvbW11L2FybS1zbW11LXYzOiBBZGQgYnlwYXNzIGZsYWcgdG/CoGFybV9z
bW11X3dyaXRlX3N0cnRhYl9lbnQoKQogIGlvbW11L2FybS1zbW11LXYzOiBHZXQgYXNzb2NpYXRl
ZCBSTVIgaW5mbyBhbmQgaW5zdGFsbCBieXBhc3MgU1RFCiAgaW9tbXUvYXJtLXNtbXUtdjM6IFJl
c2VydmUgYW55IFJNUiByZWdpb25zIGFzc29jaWF0ZWQgd2l0aCBhwqBkZXYKCiBkcml2ZXJzL2Fj
cGkvYXJtNjQvaW9ydC5jICAgICAgICAgICAgICAgICAgIHwgMTgyICsrKysrKysrKysrKysrKysr
KystCiBkcml2ZXJzL2lvbW11L2FybS9hcm0tc21tdS12My9hcm0tc21tdS12My5jIHwgMTEyICsr
KysrKysrKystLQogZHJpdmVycy9pb21tdS9hcm0vYXJtLXNtbXUtdjMvYXJtLXNtbXUtdjMuaCB8
ICAgMiArCiBkcml2ZXJzL2lvbW11L2RtYS1pb21tdS5jICAgICAgICAgICAgICAgICAgIHwgIDM5
ICsrKysrCiBpbmNsdWRlL2FjcGkvYWN0YmwyLmggICAgICAgICAgICAgICAgICAgICAgIHwgIDI1
ICsrLQogaW5jbHVkZS9saW51eC9hY3BpX2lvcnQuaCAgICAgICAgICAgICAgICAgICB8ICAgNiAr
CiBpbmNsdWRlL2xpbnV4L2RtYS1pb21tdS5oICAgICAgICAgICAgICAgICAgIHwgICA3ICsKIGlu
Y2x1ZGUvbGludXgvaW9tbXUuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgMTYgKysKIDggZmls
ZXMgY2hhbmdlZCwgMzY3IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUg
bWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
