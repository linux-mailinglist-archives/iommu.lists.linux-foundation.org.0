Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2860B3267E7
	for <lists.iommu@lfdr.de>; Fri, 26 Feb 2021 21:11:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF0CD84355;
	Fri, 26 Feb 2021 20:11:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ouxT-ciT9I_r; Fri, 26 Feb 2021 20:11:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F2B184347;
	Fri, 26 Feb 2021 20:11:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC4E2C0016;
	Fri, 26 Feb 2021 20:11:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3171C0012
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 20:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0792284336
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 20:11:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BVucjQyjMx1T for <iommu@lists.linux-foundation.org>;
 Fri, 26 Feb 2021 20:11:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0979F842CD
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 20:11:11 +0000 (UTC)
IronPort-SDR: eQ9HzhPorDFU1qKAPn7bEUE2aCdLQdWTgpDWCEQEA8dbDOi+JqriSc/csRuv+/a1ANyHUtKuOl
 k69fkScuAi6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9907"; a="247407420"
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; d="scan'208";a="247407420"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2021 12:11:10 -0800
IronPort-SDR: cTSVECa2hdLFNJLim2z71HtSUBwJyst+3D5Qbkc7AVEojga5QGDHb/ASpd0egVH/tSElCl2ryW
 ISeqwpr9MxzA==
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; d="scan'208";a="405109413"
Received: from megha-z97x-ud7-th.sc.intel.com ([143.183.85.154])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 26 Feb 2021 12:11:10 -0800
From: Megha Dey <megha.dey@intel.com>
To: tglx@linutronix.de
Subject: [Patch V2 00/13] Introduce dev-msi and interrupt message store
Date: Fri, 26 Feb 2021 12:11:04 -0800
Message-Id: <1614370277-23235-1-git-send-email-megha.dey@intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: alex.williamson@redhat.com, kevin.tian@intel.com, tony.luck@intel.com,
 dave.jiang@intel.com, ashok.raj@intel.com, kvm@vger.kernel.org,
 ravi.v.shankar@intel.com, maz@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 jgg@mellanox.com, megha.dey@intel.com, linux-pci@vger.kernel.org,
 bhelgaas@google.com, dan.j.williams@intel.com, dwmw@amazon.co.uk
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

UHJvdmlkZSBzdXBwb3J0IGZvciBkZXZpY2Ugc3BlY2lmaWMgTVNJIGltcGxlbWVudGF0aW9ucyBm
b3IgZGV2aWNlcyB3aGljaApoYXZlIHRoZWlyIG93biByZXNvdXJjZSBtYW5hZ2VtZW50IGFuZCBp
bnRlcnJ1cHQgY2hpcC4gVGhlc2UgZGV2aWNlcyBhcmUKbm90IHJlbGF0ZWQgdG8gUENJIGFuZCBj
b250cmFyeSB0byBwbGF0Zm9ybSBNU0kgdGhleSBkbyBub3Qgc2hhcmUgYQpjb21tb24gcmVzb3Vy
Y2UgYW5kIGludGVycnVwdCBjaGlwLiBUaGV5IHByb3ZpZGUgdGhlaXIgb3duIGRvbWFpbiBzcGVj
aWZpYwpyZXNvdXJjZSBtYW5hZ2VtZW50IGFuZCBpbnRlcnJ1cHQgY2hpcC4KCk9uIHRvcCBvZiB0
aGlzLCBhZGQgc3VwcG9ydCBmb3IgSW50ZXJydXB0IE1lc3NhZ2UgU3RvcmUgb3IgSU1TWzFdLCB3
aGljaAppcyBhIHNjYWxhYmxlIGRldmljZSBzcGVjaWZpYyBpbnRlcnJ1cHQgbWVjaGFuaXNtIHRv
IHN1cHBvcnQgZGV2aWNlcyB3aGljaAptYXkgbmVlZCBtb3JlIHRoYW4gMjA0OCBpbnRlcnJ1cHRz
LiBXaXRoIElNUywgdGhlcmUgaXMgdGhlb3JldGljYWxseSBubwp1cHBlciBib3VuZCBvbiB0aGUg
bnVtYmVyIG9mIGludGVycnVwdHMgYSBkZXZpY2UgY2FuIHN1cHBvcnQuIFRoZSBub3JtYWwKSU1T
IHVzZSBjYXNlIGlzIGZvciBndWVzdCB1c2FnZXMgYnV0IGl0IGNhbiB2ZXJ5IHdlbGwgYmUgdXNl
ZCBieSBob3N0IHRvby4KCkludHJvZHVjZSBhIGdlbmVyaWMgSU1TIGlycSBjaGlwIGFuZCBkb21h
aW4gd2hpY2ggc3RvcmVzIHRoZSBpbnRlcnJ1cHQKbWVzc2FnZXMgYXMgYW4gYXJyYXkgaW4gZGV2
aWNlIG1lbW9yeS4gQWxsb2NhdGlvbiBhbmQgZnJlZWluZyBvZiBpbnRlcnJ1cHRzCmhhcHBlbnMg
dmlhIHRoZSBnZW5lcmljIG1zaV9kb21haW5fYWxsb2MvZnJlZV9pcnFzKCkgaW50ZXJmYWNlLiBP
bmUgb25seQpuZWVkcyB0byBlbnN1cmUgdGhlIGludGVycnVwdCBkb21haW4gaXMgc3RvcmVkIGlu
IHRoZSB1bmRlcmx5aW5nIGRldmljZSBzdHJ1Y3QuCgpUaGVzZSBwYXRjaGVzIGNhbiBiZSBkaXZp
ZGVkIGludG8gZm9sbG93aW5nIHN0ZXBzOgoKMS4gWDg2IHNwZWNpZmljIHByZXBhcmF0aW9uIGZv
ciBkZXZpY2UgTVNJCiAgIHg4Ni9pcnE6IEFkZCBERVZfTVNJIGFsbG9jYXRpb24gdHlwZQogICB4
ODYvbXNpOiBSZW5hbWUgYW5kIHJld29yayBwY2lfbXNpX3ByZXBhcmUoKSB0byBjb3ZlciBub24t
UENJIE1TSQoKMi4gR2VuZXJpYyBkZXZpY2UgTVNJIGluZnJhc3RydWN0dXJlCiAgIHBsYXRmb3Jt
LW1zaTogUHJvdmlkZSBkZWZhdWx0IGlycV9jaGlwOjogQWNrCiAgIGdlbmlycS9wcm9jOiBUYWtl
IGJ1c2xvY2sgb24gYWZmaW5pdHkgd3JpdGUKICAgZ2VuaXJxL21zaTogUHJvdmlkZSBhbmQgdXNl
IG1zaV9kb21haW5fc2V0X2RlZmF1bHRfaW5mb19mbGFncygpCiAgIHBsYXRmb3JtLW1zaTogQWRk
IGRldmljZSBNU0kgaW5mcmFzdHJ1Y3R1cmUKICAgaXJxZG9tYWluL21zaTogUHJvdmlkZSBtc2lf
YWxsb2MvZnJlZV9zdG9yZSgpIGNhbGxiYWNrcwogICBnZW5pcnE6IFNldCBhdXhpbGlhcnkgZGF0
YSBmb3IgYW4gaW50ZXJydXB0CiAgIGdlbmlycS9tc2k6IFByb3ZpZGUgaGVscGVycyB0byByZXR1
cm4gTGludXggSVJRL2Rldl9tc2kgaHcgSVJRIG51bWJlcgoKMy4gSW50ZXJydXB0IE1lc3NhZ2Ug
U3RvcmUgKElNUykgaXJxIGRvbWFpbi9jaGlwIGltcGxlbWVudGF0aW9uIGZvciBkZXZpY2UgYXJy
YXkKICAgaXJxY2hpcDogQWRkIElNUyAoSW50ZXJydXB0IE1lc3NhZ2UgU3RvcmUpIGRyaXZlcgog
ICBpb21tdS92dC1kOiBBZGQgREVWLU1TSSBzdXBwb3J0Cgo0LiBBZGQgcGxhdGZvcm0gY2hlY2sg
Zm9yIHN1YmRldmljZSBpcnEgZG9tYWluCiAgIGlvbW11OiBBZGQgY2FwYWJpbGl0eSBJT01NVV9D
QVBfVklPTU1VCiAgIHBsYXRmb3JtLW1zaTogQWRkIHBsYXRmb3JtIGNoZWNrIGZvciBzdWJkZXZp
Y2UgaXJxIGRvbWFpbgoKVGhlIGRldmljZSBJTVMgKEludGVycnVwdCBNZXNzYWdlIFN0b3JhZ2Up
IHNob3VsZCBub3QgYmUgZW5hYmxlZCBpbiBhbnkKdmlydHVhbGl6YXRpb24gZW52aXJvbm1lbnRz
IHVubGVzcyB0aGVyZSBpcyBhIEhZUEVSQ0FMTCBkb21haW4gd2hpY2gKbWFrZXMgdGhlIGNoYW5n
ZXMgaW4gdGhlIG1lc3NhZ2Ugc3RvcmUgbW9uaXRvcmVkIGJ5IHRoZSBoeXBlcnZpc29yLlsyXQpB
cyB0aGUgaW5pdGlhbCBzdGVwLCB3ZSBhbGxvdyB0aGUgSU1TIHRvIGJlIGVuYWJsZWQgb25seSBp
ZiB3ZSBhcmUKcnVubmluZyBvbiB0aGUgYmFyZSBtZXRhbC4gSXQncyBlYXN5IHRvIGVuYWJsZSBJ
TVMgaW4gdGhlIHZpcnR1YWxpemF0aW9uCmVudmlyb25tZW50cyBpZiBhYm92ZSBwcmVjb25kaXRp
b25zIGFyZSBtZXQgaW4gdGhlIGZ1dHVyZS4KClRoZXNlIHBhdGNoZXMgaGF2ZSBiZWVuIHRlc3Rl
ZCB3aXRoIHRoZSBJRFhEIGRyaXZlcjoKICAgICAgICBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwv
aWR4ZC1kcml2ZXIgaWR4ZC1zdGFnZTIuNQpNb3N0IG9mIHRoZXNlIHBhdGNoZXMgYXJlIG9yaWdp
bmFsbHkgYnkgVGhvbWFzOgogICAgICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWh5
cGVydi8yMDIwMDgyNjExMTYyOC43OTQ5Nzk0MDFAbGludXRyb25peC5kZS8KYW5kIGFyZSByZWJh
c2VkIG9uIGxhdGVzdCBrZXJuZWwuCgpUaGlzIHBhdGNoZXMgc2VyaWVzIGhhcyB1bmRlcmdvbmUg
YSBsb3Qgb2YgY2hhbmdlcyBzaW5jZSBmaXJzdCBzdWJtaXR0ZWQgYXMgYW4gUkZDCmluIFNlcHRl
bWJlciAyMDE5LiBJIGhhdmUgZGl2aWRlZCB0aGUgY2hhbmdlcyBpbnRvIDMgc3RhZ2VzIGZvciBi
ZXR0ZXIgdW5kZXJzdGFuZGluZzoKClN0YWdlIDE6IFN0YW5kYWxvbmUgUkZDIElNUyBzZXJpZXNb
M10KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sLzE1NjgzMzgzMjgtMjI0NTgtMS1naXQtc2VuZC1lbWFpbC1tZWdoYS5kZXlA
bGludXguaW50ZWwuY29tLwpWMToKMS4gRXh0ZW5kIGV4aXN0aW5nIHBsYXRmb3JtLW1zaSB0byBz
dXBwb3J0IElNUwoyLiBwbGF0Zm9ybV9tc2lfZG9tYWluX2FsbG9jX2lycXNfZ3JvdXAgaXMgaW50
cm9kdWNlZCB0byBhbGxvY2F0ZSBJTVMKICAgaW50ZXJydXB0cywgdGFnZ2VkIHdpdGggYSBncm91
cCBJRC4KMy4gVG8gZnJlZSB2ZWN0b3JzIG9mIGEgcGFydGljdWxhciBncm91cCwgcGxhdGZvcm1f
bXNpX2RvbWFpbl9mcmVlX2lycXNfZ3JvdXAKICAgQVBJIGluIGludHJvZHVjZWQKClN0YWdlIDI6
IGRldi1tc2kvSU1TIG1lcmdlZCB3aXRoIERhdmUgSmlhbmcncyBJRFhEIHNlcmllc1syXQotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
VjE6IChjaGFuZ2VzIGZyb20gc3RhZ2UgMSk6CjEuIEludHJvZHVjZWQgYSBuZXcgbGlzdCBmb3Ig
cGxhdGZvcm0tbXNpIGRlc2NyaXB0b3JzCjIuIEludHJvZHVjZWQgZHluYW1pYyBhbGxvY2F0aW9u
IGZvciBJTVMgaW50ZXJydXB0cwozLiBzaGlmdGVkIGNyZWF0aW9uIG9mIGltcyBkb21haW4gZnJv
bSBhcmNoL3g4NiB0byBkcml2ZXJzLwo0LiBSZW1vdmVkIGFyY2ggc3BlY2lmaWMgY2FsbGJhY2tz
CjUuIEludHJvZHVjZWQgZW51bSBwbGF0Zm9ybV9tc2lfdHlwZQo2LiBBZGRlZCBtb3JlIHRlY2hu
aWNhbCBkZXRhaWxzIHRvIHRoZSBjb3ZlciBsZXR0ZXIKNy4gTWVyZ2UgY29tbW9uIGNvZGUgYmV0
d2VlbiBwbGF0Zm9ybS1tc2kuYyBhbmQgaW1zLW1zaS5jCjguIEludHJvZHVjZSBuZXcgc3RydWN0
dXJlcyBwbGF0Zm9ybV9tc2lfb3BzIGFuZCBwbGF0Zm9ybV9tc2lfZnVuY3MKOS4gQWRkcmVzc2Vk
IEFuZHJpeSBTaGV2Y2hlbmtvJ3MgY29tbWVudHMgb24gUkZDIFYxIHBhdGNoIHNlcmllcwoxMC4g
RHJvcHBlZCB0aGUgZHluYW1pYyBncm91cCBhbGxvY2F0aW9uIHNjaGVtZS4KMTEuIFVzZSBSQ1Ug
bG9jayBpbnN0ZWFkIG9mIG11dGV4IGxvY2sgdG8gcHJvdGVjdCB0aGUgZGV2aWNlIGxpc3QKClYy
OgoxLiBJTVMgbWFkZSBkZXYtbXNpCjIuIFdpdGggcmVjb21tZW5kYXRpb25zIGZyb20gSmFzb24v
VGhvbWFzL0RhbiBvbiBtYWtpbmcgSU1TIG1vcmUgZ2VuZXJpYwozLiBQYXNzIGEgbm9uLXBjaSBn
ZW5lcmljIGRldmljZShzdHJ1Y3QgZGV2aWNlKSBmb3IgSU1TIG1hbmFnZW1lbnQgaW5zdGVhZCBv
ZiBtZGV2CjQuIFJlbW92ZSBhbGwgcmVmZXJlbmNlcyB0byBtZGV2IGFuZCBzeW1ib2xfZ2V0L3B1
dAo1LiBSZW1vdmUgYWxsIHJlZmVyZW5jZXMgdG8gSU1TIGluIGNvbW1vbiBjb2RlIGFuZCByZXBs
YWNlIHdpdGggZGV2LW1zaQo2LiBSZW1vdmUgZHluYW1pYyBhbGxvY2F0aW9uIG9mIHBsYXRmb3Jt
LW1zaSBpbnRlcnJ1cHRzOiBubyBncm91cHMsbm8KICAgbmV3IG1zaSBsaXN0IG9yIGxpc3QgaGVs
cGVycwo3LiBDcmVhdGUgYSBnZW5lcmljIGRldi1tc2kgZG9tYWluIHdpdGggYW5kIHdpdGhvdXQg
aW50ZXJydXB0IHJlbWFwcGluZyBlbmFibGVkLgo4LiBJbnRyb2R1Y2UgZGV2X21zaV9kb21haW5f
YWxsb2NfaXJxcyBhbmQgZGV2X21zaV9kb21haW5fZnJlZV9pcnFzIGFwaXMKClYzOgoxLiBObyBu
ZWVkIHRvIGFkZCBzdXBwb3J0IGZvciAyIGRpZmZlcmVudCBkZXYtbXNpIGlycSBkb21haW5zLCBh
IGNvbW1vbgogICBvbmNlIGNhbiBiZSB1c2VkIGZvciBib3RoIHRoZSBjYXNlcyh3aXRoIElSIGVu
YWJsZWQvZGlzYWJsZWQpCjIuIEFkZCBhcmNoIHNwZWNpZmljIGZ1bmN0aW9uIHRvIHNwZWNpZnkg
YWRkaXRpb25zIHRvIG1zaV9wcmVwYXJlIGNhbGxiYWNrCiAgIGluc3RlYWQgb2YgbWFraW5nIHRo
ZSBjYWxsYmFjayBhIHdlYWsgZnVuY3Rpb24KMy4gQ2FsbCBwbGF0Zm9ybSBvcHMgZGlyZWN0bHkg
aW5zdGVhZCBvZiBhIHdyYXBwZXIgZnVuY3Rpb24KNC4gTWFrZSBtYXNrL3VubWFzayBjYWxsYmFj
a3MgYXMgdm9pZCBmdW5jdGlvbnMKNS4gZGV2LT5tc2lfZG9tYWluIHNob3VsZCBiZSB1cGRhdGVk
IGF0IHRoZSBkZXZpY2UgZHJpdmVyIGxldmVsIGJlZm9yZQogICBjYWxsaW5nIGRldl9tc2lfYWxs
b2NfaXJxcygpCjYuIGRldl9tc2lfYWxsb2MvZnJlZV9pcnFzKCkgY2Fubm90IGJlIHVzZWQgZm9y
IFBDSSBkZXZpY2VzCjcuIEZvbGxvd2VkIHRoZSBnZW5lcmljIGxheWVyaW5nIHNjaGVtZTogaW5m
cmFzdHJ1Y3R1cmUgYml0cy0+YXJjaCBiaXRzLT5lbmFibGluZyBiaXRzCgpWNDoKMS4gTWFrZSBp
bnRlcnJ1cHQgcmVtYXBwaW5nIGNvZGUgbW9yZSByZWFkYWJsZQoyLiBBZGQgZmx1c2ggd3JpdGVz
IHRvIHVubWFzay93cml0ZSBhbmQgcmVzZXQgaW1zIHNsb3RzCjMuIEludGVycnVwdCBNZXNzYWdl
IFN0b3JtLT4gSW50ZXJydXB0IE1lc3NhZ2UgU3RvcmUKNC4gTWVyZ2UgaW4gcGFzaWQgcHJvZ3Jh
bW1pbmcgY29kZS4KClN0YWdlIDM6IFN0YW5kYWxvbmUgZGV2LW1zaSBhbmQgSU1TIGRyaXZlciBz
ZXJpZXMKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpW
MTooQ2hhbmdlcyBmcm9tIFN0YWdlIDIgVjQpWzZdCjEuIFNwbGl0IGRldi1tc2kvSU1TIGNvZGUg
ZnJvbSBEYXZlIEppYW5n4oCZcyBJRFhEIHBhdGNoIHNlcmllcwoyLiBTZXQgdGhlIHNvdXJjZS1p
ZCBvZiBhbGwgZGV2LW1zaSBpbnRlcnJ1cHQgcmVxdWVzdHMgdG8gdGhlIHBhcmVudCBQQ0kgZGV2
aWNlCjMuIFNlcGFyYXRlZCBjb3JlIGlycSBjb2RlIGZyb20gSU1TIHJlbGF0ZWQgY29kZQo0LiBB
ZGRlZCBtaXNzaW5nIHNldF9kZXNjIG9wcyB0byB0aGUgSU1TIG1zaV9kb21haW5fb3BzCjUuIEFk
ZGVkIG1vcmUgZGV0YWlscyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UtdGVzdCBjYXNlIGZvciBhdXhp
bGxhcnkgaW50ZXJydXB0IGRhdGEKNi4gVXBkYXRlZCB0aGUgY29weXJpZ2h0IHllYXIgZnJvbSAy
MDIwIHRvIDIwMjEKNy4gVXBkYXRlZCBjb3ZlciBsZXR0ZXIKOC4gQWRkIHBsYXRmb3JtIGNoZWNr
IGZvciBzdWJkZXZpY2UgaXJxIGRvbWFpbiAoTHUgQmFvbHUpOgogICBWMS0+VjI6CiAgIC0gVjEg
cGF0Y2hlczpbNF0KICAgLSBSZW5hbWUgcHJvYmFibHlfb25fYmFyZV9tZXRhbCgpIHdpdGggb25f
YmFyZV9tZXRhbCgpOwogICAtIFNvbWUgdmVuZG9ycyBtaWdodCB1c2UgdGhlIHNhbWUgbmFtZSBm
b3IgYm90aCBiYXJlIG1ldGFsIGFuZCB2aXJ0dWFsCiAgICAgZW52aXJvbm1lbnQuIEJlZm9yZSB3
ZSBhZGQgdmVuZG9yIHNwZWNpZmljIGNvZGUgdG8gZGlzdGluZ3Vpc2gKICAgICBiZXR3ZWVuIHRo
ZW0sIGxldCdzIHJldHVybiBmYWxzZSBpbiBvbl9iYXJlX21ldGFsKCkuIFRoaXMgd29uJ3QKICAg
ICBpbnRyb2R1Y2UgYW55IHJlZ3Jlc3Npb24uIFRoZSBvbmx5IGltcGFjdCBpcyB0aGF0IHRoZSBj
b21pbmcgbmV3CiAgICAgcGxhdGZvcm0gbXNpIGZlYXR1cmUgd29uJ3QgYmUgc3VwcG9ydGVkIHVu
dGlsIHRoZSB2ZW5kb3Igc3BlY2lmaWMgY29kZQogICAgIGlzIHByb3ZpZGVkLgogICBWMi0+VjM6
CiAgIC0gVjIgcGF0Y2hlczpbNV0KICAgLSBBZGQgYWxsIGlkZW50aWZpZWQgaGV1cmlzdGljcyBz
byBmYXIKClYxLT5WMjoKMS4gcy9hcmNoX3N1cHBvcnRfcGNpX2RldmljZV9pbXMvYXJjaF9zdXBw
b3J0X3BjaV9kZXZpY2VfbXNpL2cKMi4gUmVtb3ZlIENPTkZJR19ERVZJQ0VfTVNJIGluIGFyY2gv
eDg2L3BjaS9jb21tb24uYwozLiBBZGRlZCBoZWxwZXIgZnVuY3Rpb25zIHRvIGdldCBsaW51eCBJ
UlEgYW5kIGRldi1tc2kgSFcgSVJRIG51bWJlcnMKNC4gQ2hhbmdlIHRoZSBjYWNoaW5nIG1vZGUg
bG9naWMgZnJvbSBkeW5hbWljIHRvIHN0YXRpYwoKRGF2ZSBKaWFuZyAoMSk6CiAgZ2VuaXJxL21z
aTogUHJvdmlkZSBoZWxwZXJzIHRvIHJldHVybiBMaW51eCBJUlEvZGV2X21zaSBodyBJUlEgbnVt
YmVyCgpMdSBCYW9sdSAoMik6CiAgaW9tbXU6IEFkZCBjYXBhYmlsaXR5IElPTU1VX0NBUF9WSU9N
TVVfSElOVAogIHBsYXRmb3JtLW1zaTogQWRkIHBsYXRmb3JtIGNoZWNrIGZvciBzdWJkZXZpY2Ug
aXJxIGRvbWFpbgoKTWVnaGEgRGV5ICgzKToKICBnZW5pcnE6IFNldCBhdXhpbGlhcnkgZGF0YSBm
b3IgYW4gaW50ZXJydXB0CiAgaW9tbXUvdnQtZDogQWRkIERFVi1NU0kgc3VwcG9ydAogIGlycWNo
aXA6IEFkZCBJTVMgKEludGVycnVwdCBNZXNzYWdlIFN0b3JlKSBkcml2ZXIKClRob21hcyBHbGVp
eG5lciAoNyk6CiAgeDg2L2lycTogQWRkIERFVl9NU0kgYWxsb2NhdGlvbiB0eXBlCiAgeDg2L21z
aTogUmVuYW1lIGFuZCByZXdvcmsgcGNpX21zaV9wcmVwYXJlKCkgdG8gY292ZXIgbm9uLVBDSSBN
U0kKICBwbGF0Zm9ybS1tc2k6IFByb3ZpZGUgZGVmYXVsdCBpcnFfY2hpcDo6IEFjawogIGdlbmly
cS9wcm9jOiBUYWtlIGJ1c2xvY2sgb24gYWZmaW5pdHkgd3JpdGUKICBnZW5pcnEvbXNpOiBQcm92
aWRlIGFuZCB1c2UgbXNpX2RvbWFpbl9zZXRfZGVmYXVsdF9pbmZvX2ZsYWdzKCkKICBwbGF0Zm9y
bS1tc2k6IEFkZCBkZXZpY2UgTVNJIGluZnJhc3RydWN0dXJlCiAgaXJxZG9tYWluL21zaTogUHJv
dmlkZSBtc2lfYWxsb2MvZnJlZV9zdG9yZSgpIGNhbGxiYWNrcwoKIGFyY2gveDg2L2luY2x1ZGUv
YXNtL2h3X2lycS5oICAgICAgIHwgICAxICsKIGFyY2gveDg2L2luY2x1ZGUvYXNtL21zaS5oICAg
ICAgICAgIHwgICA0ICstCiBhcmNoL3g4Ni9rZXJuZWwvYXBpYy9tc2kuYyAgICAgICAgICB8ICAy
NyArKystLQogYXJjaC94ODYvcGNpL2NvbW1vbi5jICAgICAgICAgICAgICAgfCAgNzIgKysrKysr
KysrKysrCiBkcml2ZXJzL2Jhc2UvcGxhdGZvcm0tbXNpLmMgICAgICAgICB8IDE0MSArKysrKysr
KysrKysrKysrKysrKysrKysKIGRyaXZlcnMvaW9tbXUvYW1kL2lvbW11LmMgICAgICAgICAgIHwg
ICAyICsKIGRyaXZlcnMvaW9tbXUvaW50ZWwvaW9tbXUuYyAgICAgICAgIHwgICA1ICsKIGRyaXZl
cnMvaW9tbXUvaW50ZWwvaXJxX3JlbWFwcGluZy5jIHwgICA2ICstCiBkcml2ZXJzL2lvbW11L3Zp
cnRpby1pb21tdS5jICAgICAgICB8ICAgOSArKwogZHJpdmVycy9pcnFjaGlwL0tjb25maWcgICAg
ICAgICAgICAgfCAgMTQgKysrCiBkcml2ZXJzL2lycWNoaXAvTWFrZWZpbGUgICAgICAgICAgICB8
ICAgMSArCiBkcml2ZXJzL2lycWNoaXAvaXJxLWltcy1tc2kuYyAgICAgICB8IDIxMSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNp
LWh5cGVydi5jIHwgICAyICstCiBkcml2ZXJzL3BjaS9tc2kuYyAgICAgICAgICAgICAgICAgICB8
ICAgNyArLQogaW5jbHVkZS9saW51eC9pbnRlcnJ1cHQuaCAgICAgICAgICAgfCAgIDIgKwogaW5j
bHVkZS9saW51eC9pb21tdS5oICAgICAgICAgICAgICAgfCAgIDIgKwogaW5jbHVkZS9saW51eC9p
cnEuaCAgICAgICAgICAgICAgICAgfCAgIDQgKwogaW5jbHVkZS9saW51eC9pcnFjaGlwL2lycS1p
bXMtbXNpLmggfCAgNjggKysrKysrKysrKysrCiBpbmNsdWRlL2xpbnV4L2lycWRvbWFpbi5oICAg
ICAgICAgICB8ICAgMSArCiBpbmNsdWRlL2xpbnV4L21zaS5oICAgICAgICAgICAgICAgICB8ICA0
MSArKysrKysrCiBrZXJuZWwvaXJxL0tjb25maWcgICAgICAgICAgICAgICAgICB8ICAgNCArCiBr
ZXJuZWwvaXJxL21hbmFnZS5jICAgICAgICAgICAgICAgICB8ICAzOCArKysrKystCiBrZXJuZWwv
aXJxL21zaS5jICAgICAgICAgICAgICAgICAgICB8ICA3OSArKysrKysrKysrKysrKwogMjMgZmls
ZXMgY2hhbmdlZCwgNzIyIGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvaXJxY2hpcC9pcnEtaW1zLW1zaS5jCiBjcmVhdGUgbW9kZSAxMDA2
NDQgaW5jbHVkZS9saW51eC9pcnFjaGlwL2lycS1pbXMtbXNpLmgKCi0tIAoyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBs
aXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
