Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC6418A48B
	for <lists.iommu@lfdr.de>; Wed, 18 Mar 2020 21:55:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 040DF85CD0;
	Wed, 18 Mar 2020 20:55:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 72iZUlf2T0Kg; Wed, 18 Mar 2020 20:55:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 82AC385C9F;
	Wed, 18 Mar 2020 20:55:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A95EC013E;
	Wed, 18 Mar 2020 20:55:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 322FDC1D8F
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 20:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 15CF786C5C
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 20:55:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id scLEE6z3cEgS for <iommu@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 20:55:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 772C086ACB
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 20:55:05 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47BFB2098B;
 Wed, 18 Mar 2020 20:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584564905;
 bh=XBgTFlX9YXtui+urJgbxobj6L9lBEdzNQiE1J9yXk+c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q7u/QirphnINASAo0xmnOL3SrLXd0rrOrbkHtahdFJp+b8ItBchgga8IW6CnP2dEe
 dhXKG+YRyXbkvMc0tblbWN6DzvrR31/PsoCtQFhcR23aXQZsL85BBMHJy9t1Qmg2Ii
 d6sW1hevZch0rTcQv9PFmu30WKEDTIFRydxoWkH0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 71/73] iommu/vt-d: Ignore devices with out-of-spec
 domain number
Date: Wed, 18 Mar 2020 16:53:35 -0400
Message-Id: <20200318205337.16279-71-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200318205337.16279-1-sashal@kernel.org>
References: <20200318205337.16279-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, iommu@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, Daniel Drake <drake@endlessm.com>
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

RnJvbTogRGFuaWVsIERyYWtlIDxkcmFrZUBlbmRsZXNzbS5jb20+CgpbIFVwc3RyZWFtIGNvbW1p
dCBkYTcyYTM3OWIyZWMwYmFkM2ViMjY1Nzg3ZjcwMDhiZWFkMGIwNDBjIF0KClZNRCBzdWJkZXZp
Y2VzIGFyZSBjcmVhdGVkIHdpdGggYSBQQ0kgZG9tYWluIElEIG9mIDB4MTAwMDAgb3IKaGlnaGVy
LgoKVGhlc2Ugc3ViZGV2aWNlcyBhcmUgYWxzbyBoYW5kbGVkIGxpa2UgYWxsIG90aGVyIFBDSSBk
ZXZpY2VzIGJ5CmRtYXJfcGNpX2J1c19ub3RpZmllcigpLgoKSG93ZXZlciwgd2hlbiBkbWFyX2Fs
bG9jX3BjaV9ub3RpZnlfaW5mbygpIHRha2UgcmVjb3JkcyBvZiBzdWNoIGRldmljZXMsCml0IHdp
bGwgdHJ1bmNhdGUgdGhlIGRvbWFpbiBJRCB0byBhIHUxNiB2YWx1ZSAoaW4gaW5mby0+c2VnKS4K
VGhlIGRldmljZSBhdCAoZS5nLikgMTAwMDA6MDA6MDIuMCBpcyB0aGVuIHRyZWF0ZWQgYnkgdGhl
IERNQVIgY29kZSBhcyBpZgppdCBpcyAwMDAwOjAwOjAyLjAuCgpJbiB0aGUgdW5sdWNreSBldmVu
dCB0aGF0IGEgcmVhbCBkZXZpY2UgYWxzbyBleGlzdHMgYXQgMDAwMDowMDowMi4wIGFuZAphbHNv
IGhhcyBhIGRldmljZS1zcGVjaWZpYyBlbnRyeSBpbiB0aGUgRE1BUiB0YWJsZSwKZG1hcl9pbnNl
cnRfZGV2X3Njb3BlKCkgd2lsbCBjcmFzaCBvbjoKIMKgIEJVR19PTihpID49IGRldmljZXNfY250
KTsKClRoYXQncyBiYXNpY2FsbHkgYSBzYW5pdHkgY2hlY2sgdGhhdCBvbmx5IG9uZSBQQ0kgZGV2
aWNlIG1hdGNoZXMgYQpzaW5nbGUgRE1BUiBlbnRyeTsgaW4gdGhpcyBjYXNlIHdlIHNlZW0gdG8g
aGF2ZSB0d28gbWF0Y2hpbmcgZGV2aWNlcy4KCkZpeCB0aGlzIGJ5IGlnbm9yaW5nIGRldmljZXMg
dGhhdCBoYXZlIGEgZG9tYWluIG51bWJlciBoaWdoZXIgdGhhbgp3aGF0IGNhbiBiZSBsb29rZWQg
dXAgaW4gdGhlIERNQVIgdGFibGUuCgpUaGlzIHByb2JsZW0gd2FzIGNhcmVmdWxseSBkaWFnbm9z
ZWQgYnkgSmlhbi1Ib25nIFBhbi4KClNpZ25lZC1vZmYtYnk6IEx1IEJhb2x1IDxiYW9sdS5sdUBs
aW51eC5pbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBEcmFrZSA8ZHJha2VAZW5kbGVz
c20uY29tPgpGaXhlczogNTljZTA1MTVjZGFmMyAoImlvbW11L3Z0LWQ6IFVwZGF0ZSBEUkhEL1JN
UlIvQVRTUiBkZXZpY2Ugc2NvcGUgY2FjaGVzIHdoZW4gUENJIGhvdHBsdWcgaGFwcGVucyIpClNp
Z25lZC1vZmYtYnk6IEpvZXJnIFJvZWRlbCA8anJvZWRlbEBzdXNlLmRlPgpTaWduZWQtb2ZmLWJ5
OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9pb21tdS9kbWFy
LmMgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pb21tdS9kbWFyLmMgYi9kcml2ZXJzL2lvbW11L2RtYXIuYwppbmRleCBh
YTE1MTU1Yjk0MDFmLi4zNGU3MDVkM2I2YmI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lvbW11L2Rt
YXIuYworKysgYi9kcml2ZXJzL2lvbW11L2RtYXIuYwpAQCAtMjgsNiArMjgsNyBAQAogI2luY2x1
ZGUgPGxpbnV4L3NsYWIuaD4KICNpbmNsdWRlIDxsaW51eC9pb21tdS5oPgogI2luY2x1ZGUgPGxp
bnV4L251bWEuaD4KKyNpbmNsdWRlIDxsaW51eC9saW1pdHMuaD4KICNpbmNsdWRlIDxhc20vaXJx
X3JlbWFwcGluZy5oPgogI2luY2x1ZGUgPGFzbS9pb21tdV90YWJsZS5oPgogCkBAIC0xMjgsNiAr
MTI5LDEzIEBAIGRtYXJfYWxsb2NfcGNpX25vdGlmeV9pbmZvKHN0cnVjdCBwY2lfZGV2ICpkZXYs
IHVuc2lnbmVkIGxvbmcgZXZlbnQpCiAKIAlCVUdfT04oZGV2LT5pc192aXJ0Zm4pOwogCisJLyoK
KwkgKiBJZ25vcmUgZGV2aWNlcyB0aGF0IGhhdmUgYSBkb21haW4gbnVtYmVyIGhpZ2hlciB0aGFu
IHdoYXQgY2FuCisJICogYmUgbG9va2VkIHVwIGluIERNQVIsIGUuZy4gVk1EIHN1YmRldmljZXMg
d2l0aCBkb21haW4gMHgxMDAwMAorCSAqLworCWlmIChwY2lfZG9tYWluX25yKGRldi0+YnVzKSA+
IFUxNl9NQVgpCisJCXJldHVybiBOVUxMOworCiAJLyogT25seSBnZW5lcmF0ZSBwYXRoW10gZm9y
IGRldmljZSBhZGRpdGlvbiBldmVudCAqLwogCWlmIChldmVudCA9PSBCVVNfTk9USUZZX0FERF9E
RVZJQ0UpCiAJCWZvciAodG1wID0gZGV2OyB0bXA7IHRtcCA9IHRtcC0+YnVzLT5zZWxmKQotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
b21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
