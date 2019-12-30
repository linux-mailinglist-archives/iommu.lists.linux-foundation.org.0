Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1233E12D2A0
	for <lists.iommu@lfdr.de>; Mon, 30 Dec 2019 18:26:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AC01A81D11;
	Mon, 30 Dec 2019 17:26:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zYNrCDbxQEdP; Mon, 30 Dec 2019 17:26:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 195B781AC0;
	Mon, 30 Dec 2019 17:26:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1051DC077D;
	Mon, 30 Dec 2019 17:26:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8305C077D
 for <iommu@lists.linux-foundation.org>; Mon, 30 Dec 2019 17:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 96FEE204F1
 for <iommu@lists.linux-foundation.org>; Mon, 30 Dec 2019 17:26:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XbCpVWbKkZCb for <iommu@lists.linux-foundation.org>;
 Mon, 30 Dec 2019 17:26:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id A2285204EE
 for <iommu@lists.linux-foundation.org>; Mon, 30 Dec 2019 17:26:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 624E22071E;
 Mon, 30 Dec 2019 17:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577726790;
 bh=hpl/Co9KS2/LOKvrmlKkOwb9bVMQhrdELM9/mYvA0mA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YljdSTY8qMLQXFtcQUD+tseAIbH85X09zfrYeOaKxNX76qV9rOa6XYOpMvzGcJfS1
 6Bi6MvXfoL9Tzu0mtaINRfCGeXfaIBqHASTe4n4BlzG3Vvcy1TgB5Nq809XWxBdCUA
 MgQhpM1Ty8oyJIrxW270k6WOqqtMG3MJJXunOIN4=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Eric Auger <eric.auger@redhat.com>,
 Douglas Anderson <dianders@chromium.org>, Suman Anna <s-anna@ti.com>,
 Tero Kristo <t-kristo@ti.com>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] iommu: omap: Fix printing format for size_t on 64-bit
Date: Mon, 30 Dec 2019 18:26:18 +0100
Message-Id: <20191230172619.17814-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191230172619.17814-1-krzk@kernel.org>
References: <20191230172619.17814-1-krzk@kernel.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzk@kernel.org>
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

UHJpbnQgc2l6ZV90IGFzICV6dSBvciAlenggdG8gZml4IC1XZm9ybWF0IHdhcm5pbmdzIHdoZW4g
Y29tcGlsaW5nIG9uCjY0LWJpdCBwbGF0Zm9ybSAoZS5nLiB3aXRoIENPTVBJTEVfVEVTVCk6Cgog
ICAgZHJpdmVycy9pb21tdS9vbWFwLWlvbW11LmM6IEluIGZ1bmN0aW9uIOKAmGZsdXNoX2lvdGxi
X3BhZ2XigJk6CiAgICBkcml2ZXJzL2lvbW11L29tYXAtaW9tbXUuYzo0Mzc6NDc6IHdhcm5pbmc6
CiAgICAgICAgZm9ybWF0IOKAmCV44oCZIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJh1bnNp
Z25lZCBpbnTigJksCiAgICAgICAgYnV0IGFyZ3VtZW50IDcgaGFzIHR5cGUg4oCYc2l6ZV90IHth
a2EgbG9uZyB1bnNpZ25lZCBpbnR94oCZIFstV2Zvcm1hdD1dCgpTaWduZWQtb2ZmLWJ5OiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9pb21tdS9vbWFw
LWlvbW11LmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvb21hcC1pb21tdS5jIGIv
ZHJpdmVycy9pb21tdS9vbWFwLWlvbW11LmMKaW5kZXggNTBlOGFjZjg4ZWM0Li44ODdmZWZjYjAz
YjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW9tbXUvb21hcC1pb21tdS5jCisrKyBiL2RyaXZlcnMv
aW9tbXUvb21hcC1pb21tdS5jCkBAIC00MzQsNyArNDM0LDcgQEAgc3RhdGljIHZvaWQgZmx1c2hf
aW90bGJfcGFnZShzdHJ1Y3Qgb21hcF9pb21tdSAqb2JqLCB1MzIgZGEpCiAJCWJ5dGVzID0gaW9w
Z3N6X3RvX2J5dGVzKGNyLmNhbSAmIDMpOwogCiAJCWlmICgoc3RhcnQgPD0gZGEpICYmIChkYSA8
IHN0YXJ0ICsgYnl0ZXMpKSB7Ci0JCQlkZXZfZGJnKG9iai0+ZGV2LCAiJXM6ICUwOHg8PSUwOHgo
JXgpXG4iLAorCQkJZGV2X2RiZyhvYmotPmRldiwgIiVzOiAlMDh4PD0lMDh4KCV6eClcbiIsCiAJ
CQkJX19mdW5jX18sIHN0YXJ0LCBkYSwgYnl0ZXMpOwogCQkJaW90bGJfbG9hZF9jcihvYmosICZj
cik7CiAJCQlpb21tdV93cml0ZV9yZWcob2JqLCAxLCBNTVVfRkxVU0hfRU5UUlkpOwpAQCAtMTM1
MiwxMSArMTM1MiwxMSBAQCBzdGF0aWMgaW50IG9tYXBfaW9tbXVfbWFwKHN0cnVjdCBpb21tdV9k
b21haW4gKmRvbWFpbiwgdW5zaWduZWQgbG9uZyBkYSwKIAogCW9tYXBfcGdzeiA9IGJ5dGVzX3Rv
X2lvcGdzeihieXRlcyk7CiAJaWYgKG9tYXBfcGdzeiA8IDApIHsKLQkJZGV2X2VycihkZXYsICJp
bnZhbGlkIHNpemUgdG8gbWFwOiAlZFxuIiwgYnl0ZXMpOworCQlkZXZfZXJyKGRldiwgImludmFs
aWQgc2l6ZSB0byBtYXA6ICV6dVxuIiwgYnl0ZXMpOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAK
LQlkZXZfZGJnKGRldiwgIm1hcHBpbmcgZGEgMHglbHggdG8gcGEgJXBhIHNpemUgMHgleFxuIiwg
ZGEsICZwYSwgYnl0ZXMpOworCWRldl9kYmcoZGV2LCAibWFwcGluZyBkYSAweCVseCB0byBwYSAl
cGEgc2l6ZSAweCV6eFxuIiwgZGEsICZwYSwgYnl0ZXMpOwogCiAJaW90bGJfaW5pdF9lbnRyeSgm
ZSwgZGEsIHBhLCBvbWFwX3Bnc3opOwogCkBAIC0xMzkzLDcgKzEzOTMsNyBAQCBzdGF0aWMgc2l6
ZV90IG9tYXBfaW9tbXVfdW5tYXAoc3RydWN0IGlvbW11X2RvbWFpbiAqZG9tYWluLCB1bnNpZ25l
ZCBsb25nIGRhLAogCXNpemVfdCBieXRlcyA9IDA7CiAJaW50IGk7CiAKLQlkZXZfZGJnKGRldiwg
InVubWFwcGluZyBkYSAweCVseCBzaXplICV1XG4iLCBkYSwgc2l6ZSk7CisJZGV2X2RiZyhkZXYs
ICJ1bm1hcHBpbmcgZGEgMHglbHggc2l6ZSAlenVcbiIsIGRhLCBzaXplKTsKIAogCWlvbW11ID0g
b21hcF9kb21haW4tPmlvbW11czsKIAlmb3IgKGkgPSAwOyBpIDwgb21hcF9kb21haW4tPm51bV9p
b21tdXM7IGkrKywgaW9tbXUrKykgewotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMu
bGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21h
aWxtYW4vbGlzdGluZm8vaW9tbXU=
