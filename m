Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B07951783F9
	for <lists.iommu@lfdr.de>; Tue,  3 Mar 2020 21:28:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 60A2487100;
	Tue,  3 Mar 2020 20:28:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OVPSUN30zOcO; Tue,  3 Mar 2020 20:28:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0377587541;
	Tue,  3 Mar 2020 20:28:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1AA2C013E;
	Tue,  3 Mar 2020 20:28:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00D47C013E
 for <iommu@lists.linux-foundation.org>; Tue,  3 Mar 2020 20:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E455A86749
 for <iommu@lists.linux-foundation.org>; Tue,  3 Mar 2020 20:27:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oH2fSR0JqRNZ for <iommu@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 20:27:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6185C86746
 for <iommu@lists.linux-foundation.org>; Tue,  3 Mar 2020 20:27:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D1F0B2146E;
 Tue,  3 Mar 2020 20:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583267279;
 bh=TQFREpodh737XGIeLodUL4HQM120tMrx7VDRn4FVH5s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K2fxUzPZjjlvmQGv/totKM6I2eRCVswvMRU+oJsWgdKxX8LxcmNzI+0DmamY+/9lr
 Q/LSoVuBXxzH7DCrB7lJtZDOrPuCMA5t85V9dUPBv0FbDfy8IexkAv7TuNRzI/tJtk
 NnpA1DdQMfxWipFvVgd0lut3umhWKdAQ7sWeGp60=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 2/4] iommu/omap: Fix printing format for size_t on
 64-bit
Date: Tue,  3 Mar 2020 21:27:49 +0100
Message-Id: <20200303202751.5153-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303202751.5153-1-krzk@kernel.org>
References: <20200303202751.5153-1-krzk@kernel.org>
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
a2EgbG9uZyB1bnNpZ25lZCBpbnR94oCZIFstV2Zvcm1hdD1dCgpBY2tlZC1ieTogU3VtYW4gQW5u
YSA8cy1hbm5hQHRpLmNvbT4KU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
a0BrZXJuZWwub3JnPgoKLS0tCgpOb3QgdGVzdGVkIG9uIGhhcmR3YXJlLgotLS0KIGRyaXZlcnMv
aW9tbXUvb21hcC1pb21tdS5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L29tYXAt
aW9tbXUuYyBiL2RyaXZlcnMvaW9tbXUvb21hcC1pb21tdS5jCmluZGV4IDUwZThhY2Y4OGVjNC4u
ODg3ZmVmY2IwM2I0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lvbW11L29tYXAtaW9tbXUuYworKysg
Yi9kcml2ZXJzL2lvbW11L29tYXAtaW9tbXUuYwpAQCAtNDM0LDcgKzQzNCw3IEBAIHN0YXRpYyB2
b2lkIGZsdXNoX2lvdGxiX3BhZ2Uoc3RydWN0IG9tYXBfaW9tbXUgKm9iaiwgdTMyIGRhKQogCQli
eXRlcyA9IGlvcGdzel90b19ieXRlcyhjci5jYW0gJiAzKTsKIAogCQlpZiAoKHN0YXJ0IDw9IGRh
KSAmJiAoZGEgPCBzdGFydCArIGJ5dGVzKSkgewotCQkJZGV2X2RiZyhvYmotPmRldiwgIiVzOiAl
MDh4PD0lMDh4KCV4KVxuIiwKKwkJCWRldl9kYmcob2JqLT5kZXYsICIlczogJTA4eDw9JTA4eCgl
engpXG4iLAogCQkJCV9fZnVuY19fLCBzdGFydCwgZGEsIGJ5dGVzKTsKIAkJCWlvdGxiX2xvYWRf
Y3Iob2JqLCAmY3IpOwogCQkJaW9tbXVfd3JpdGVfcmVnKG9iaiwgMSwgTU1VX0ZMVVNIX0VOVFJZ
KTsKQEAgLTEzNTIsMTEgKzEzNTIsMTEgQEAgc3RhdGljIGludCBvbWFwX2lvbW11X21hcChzdHJ1
Y3QgaW9tbXVfZG9tYWluICpkb21haW4sIHVuc2lnbmVkIGxvbmcgZGEsCiAKIAlvbWFwX3Bnc3og
PSBieXRlc190b19pb3Bnc3ooYnl0ZXMpOwogCWlmIChvbWFwX3Bnc3ogPCAwKSB7Ci0JCWRldl9l
cnIoZGV2LCAiaW52YWxpZCBzaXplIHRvIG1hcDogJWRcbiIsIGJ5dGVzKTsKKwkJZGV2X2Vycihk
ZXYsICJpbnZhbGlkIHNpemUgdG8gbWFwOiAlenVcbiIsIGJ5dGVzKTsKIAkJcmV0dXJuIC1FSU5W
QUw7CiAJfQogCi0JZGV2X2RiZyhkZXYsICJtYXBwaW5nIGRhIDB4JWx4IHRvIHBhICVwYSBzaXpl
IDB4JXhcbiIsIGRhLCAmcGEsIGJ5dGVzKTsKKwlkZXZfZGJnKGRldiwgIm1hcHBpbmcgZGEgMHgl
bHggdG8gcGEgJXBhIHNpemUgMHglenhcbiIsIGRhLCAmcGEsIGJ5dGVzKTsKIAogCWlvdGxiX2lu
aXRfZW50cnkoJmUsIGRhLCBwYSwgb21hcF9wZ3N6KTsKIApAQCAtMTM5Myw3ICsxMzkzLDcgQEAg
c3RhdGljIHNpemVfdCBvbWFwX2lvbW11X3VubWFwKHN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFp
biwgdW5zaWduZWQgbG9uZyBkYSwKIAlzaXplX3QgYnl0ZXMgPSAwOwogCWludCBpOwogCi0JZGV2
X2RiZyhkZXYsICJ1bm1hcHBpbmcgZGEgMHglbHggc2l6ZSAldVxuIiwgZGEsIHNpemUpOworCWRl
dl9kYmcoZGV2LCAidW5tYXBwaW5nIGRhIDB4JWx4IHNpemUgJXp1XG4iLCBkYSwgc2l6ZSk7CiAK
IAlpb21tdSA9IG9tYXBfZG9tYWluLT5pb21tdXM7CiAJZm9yIChpID0gMDsgaSA8IG9tYXBfZG9t
YWluLT5udW1faW9tbXVzOyBpKyssIGlvbW11KyspIHsKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0Cmlv
bW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
