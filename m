Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 16809A81F1
	for <lists.iommu@lfdr.de>; Wed,  4 Sep 2019 14:13:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D87CE14C3;
	Wed,  4 Sep 2019 12:13:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5B7CF14B3
	for <iommu@lists.linux-foundation.org>;
	Wed,  4 Sep 2019 12:13:08 +0000 (UTC)
X-Greylist: delayed 00:05:01 by SQLgrey-1.7.6
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 88F3388E
	for <iommu@lists.linux-foundation.org>;
	Wed,  4 Sep 2019 12:13:07 +0000 (UTC)
Received: from ramsan ([84.194.98.4]) by xavier.telenet-ops.be with bizsmtp
	id xQ832000l05gfCL01Q83dn; Wed, 04 Sep 2019 14:08:04 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1i5U4x-0001aj-IG; Wed, 04 Sep 2019 14:08:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1i5U4x-0000Ze-GX; Wed, 04 Sep 2019 14:08:03 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 0/2] iommu/ipmmu-vmsa: Disable cache snoop transactions on
	R-Car Gen3
Date: Wed,  4 Sep 2019 14:08:00 +0200
Message-Id: <20190904120802.2163-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-renesas-soc@vger.kernel.org, iommu@lists.linux-foundation.org,
	Magnus Damm <damm+renesas@opensource.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

CUhpIErDtnJnLAoKQWNjb3JkaW5nIHRvIHJlY2VudCBlcnJhdGEsIHRoZSBJT01NVSBpbiBSLUNh
ciBHZW4zIFNvQ3MgZG9lcyBub3QKc3VwcG9ydCBjYWNoZSBzbm9vcCB0cmFuc2FjdGlvbnMgZm9y
IHBhZ2UgdGFibGUgd2FsayByZXF1ZXN0cy4KCkhlbmNlIHRoaXMgcGF0Y2ggc2VyaWVzIHNraXBz
IHRoZSByZWxhdGVkIHNldHVwIHdoZW4gcnVubmluZyBvbiBSLUNhcgpHZW4zLCBhZnRlciBkb2lu
ZyBhIGN1c3RvbWFyeSBjbGVhbnVwIG9mIHJlbGF0ZWQgZGVmaW5pdGlvbnMuCgpUZXN0ZWQgb24g
Ui1DYXIgSDMgRVMyLjAgd2l0aCBRRU1VK0tWTSBhbmQgVkZJTyBmb3IgRXRoZXJBVkIuCgpUaGFu
a3MhCgpHZWVydCBVeXR0ZXJob2V2ZW4gKDEpOgogIGlvbW11L2lwbW11LXZtc2E6IE1vdmUgSU1U
VEJDUl9TTDBfVFdPQklUXyogdG8gcmVzdG9yZSBzb3J0IG9yZGVyCgpIYWkgTmd1eWVuIFBoYW0g
KDEpOgogIGlvbW11L2lwbW11LXZtc2E6IERpc2FibGUgY2FjaGUgc25vb3AgdHJhbnNhY3Rpb25z
IG9uIFItQ2FyIEdlbjMKCiBkcml2ZXJzL2lvbW11L2lwbW11LXZtc2EuYyB8IDc4ICsrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNDEgaW5zZXJ0
aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgpHcntvZXRqZSxlZXRpbmd9cywK
CgkJCQkJCUdlZXJ0CgotLQpHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KCQkJCQkJCSAgICAtLSBMaW51cyBUb3J2YWxkcwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWls
aW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
