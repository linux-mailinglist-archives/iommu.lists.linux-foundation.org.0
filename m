Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D8F141778
	for <lists.iommu@lfdr.de>; Sat, 18 Jan 2020 13:35:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DE19887F3F;
	Sat, 18 Jan 2020 12:35:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jOVhllVFzofF; Sat, 18 Jan 2020 12:35:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 043BC87F9C;
	Sat, 18 Jan 2020 12:35:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1366C077D;
	Sat, 18 Jan 2020 12:35:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78B2BC077D
 for <iommu@lists.linux-foundation.org>; Sat, 18 Jan 2020 04:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 67624873B6
 for <iommu@lists.linux-foundation.org>; Sat, 18 Jan 2020 04:26:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UBz1qbvnLvEG for <iommu@lists.linux-foundation.org>;
 Sat, 18 Jan 2020 04:26:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from cambricon.cn (unknown [117.119.69.60])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5646886B19
 for <iommu@lists.linux-foundation.org>; Sat, 18 Jan 2020 04:26:30 +0000 (UTC)
Received: by ajax-webmail-cambricon-mail (Coremail) ; Sat, 18 Jan 2020
 12:20:31 +0800 (GMT+08:00)
X-Originating-IP: [172.10.80.150]
Date: Sat, 18 Jan 2020 12:20:31 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5ZGo5YWJ6L+q?= <zhouguangdi@cambricon.com>
To: iommu@lists.linux-foundation.org
Subject: intel iommu pasid question
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.8 build 20180929(7a9be5e8)
 Copyright (c) 2002-2020 www.mailtech.cn cambricon.com
In-Reply-To: <2419db41.2662.16fb6dfed52.Coremail.zhouguangdi@cambricon.com>
References: <2419db41.2662.16fb6dfed52.Coremail.zhouguangdi@cambricon.com>
MIME-Version: 1.0
Message-ID: <47df2cee.2663.16fb6e186ce.Coremail.zhouguangdi@cambricon.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwCXFx2PhyJeW3wYAA--.7347W
X-CM-SenderInfo: 52kr3wpxdqwv3l6ftz5eulu03qof0z/1tbiAQABDVwbQIIf5gAAsx
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
X-Mailman-Approved-At: Sat, 18 Jan 2020 12:35:26 +0000
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

SGkgYWxs77yMICAKCgpJIGFtIGN1cnJlbnRseSBkZXZlbG9waW5nIGEgcGNpZSBkZXZpY2UgZHJp
dmVyIG9uIExpbnV4IGtlcm5lbCA0LjQgb3IgbGF0ZXIuIEkgd2FudCB0byB1c2UgcGFzaWQgdG8g
ZGlyZWN0bHkgYWNjZXNzIHVzZXItbW9kZSBtZW1vcnkuIEJ1dCBJIGZvdW5kIHRoYXQgdGhlIGlv
bW11IG9mIG15IGRldmVsb3BtZW50IG1hY2hpbmUgZG9lcyBub3Qgc3VwcG9ydCBwYXNpZC5wYXNp
ZF9lbmFibGVkKGlvbW11KSBvciBwYXNpZF9zdXBwb3J0ZWQoaW9tbXUpIHJldHVybiBmYWxzZS4K
CgpJIHdhbnQgdG8ga25vdyBob3cgdG8gZW5hYmxlIHRoZSBwYXNpZCBmdW5jdGlvbiBvZiBpbnRl
bCBpb21tde+8jElzIHRoZXJlIGEgc2VwYXJhdGUgc3dpdGNoIHRvIGVuYWJsZSB0aGUgaW9tbXUg
cGFzaWQgZnVuY3Rpb24gb3IgdGhlIGlvbW11IGhhcmR3YXJlIGltcGxlbWVudGF0aW9uIGhhcyBk
ZWNpZGVkIHdoZXRoZXIgdG8gc3VwcG9ydCBQQVNJRCBhbmQgdGhlIHNvZnR3YXJlIGNhbm5vdCBj
b25maWd1cmUgaXTvvJ8KCgpIb3cgY2FuIEkgY2hlY2sgd2hpY2ggdmVyc2lvbiBvZiBpbnRlbCB2
dC1kIGlzIGltcGxlbWVudGVkIGJ5IGlvbW11IG9uIG15IHBsYXRmb3JtP0RvZXMgdGhlIHZhbHVl
IG9mIGlvbW11J3MgVmVyc2lvbiBSZWdpc3RlciByZXByZXNlbnQgdGhlIHZ0LWQgdmVyc2lvbj8g
CnRoZSBpb21tdSB2ZXJzaW9uIHJlZ2lzdGVyIG9mIG15IGludGVsIHhlb24gZ29sZCA1MTE4IHBs
YXRmb3JtIHNlcnZlciBpcyAxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW9tbXU=
