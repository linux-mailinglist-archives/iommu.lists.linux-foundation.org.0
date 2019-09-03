Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FD1A5F30
	for <lists.iommu@lfdr.de>; Tue,  3 Sep 2019 04:10:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A0535AE7;
	Tue,  3 Sep 2019 02:10:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 81E78AE7
	for <iommu@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 02:10:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5CD69712
	for <iommu@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 02:10:35 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id j15so17697844qtl.13
	for <iommu@lists.linux-foundation.org>;
	Mon, 02 Sep 2019 19:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
	h=from:content-transfer-encoding:mime-version:subject:message-id:date
	:cc:to; bh=8YDLccInGWFdS69PIwuMSSYlryHoVdSUZ0l2DD25u48=;
	b=XaSSavAic+WaMS3qYO9pgU1eanGZSRHlvoBBUYcVCUO3lTBFIFFTII+TPYvVTLJbPe
	XmXBH03s4Ki5GjB80ExcmAGfZN72j5Vzv+dJskX8h99cBSQsIMZSIhW+p2kGL9dHzwbm
	34OSeO3gKKnMHNAM4gI4FBWufThv5RkZLZUQE5XFKT+eVCrT7ertViTMv9juEBGTVUz0
	EVWw66sTgL7xDPTAnxB3qfNQqmn6is9wctuAKV/TwzCb2jDuNkxWomFKJJG6SVQy4jM8
	qCWVUQKxYIuzmVJ5v7PSswIxJXEvPLk9I8w0KVBvDO51DyjPIzpbsWVRejyZhUMOF4Hc
	iKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:message-id:date:cc:to;
	bh=8YDLccInGWFdS69PIwuMSSYlryHoVdSUZ0l2DD25u48=;
	b=PEWT5wsBivlKM67sIx6LFmFMzJ49qQNhINXzH8TK8uV1bJDlWY43c8SW8pdra1H6PL
	MvfhP7C5tp40/NacSfrpNqGxAyBVNntSa598UBuO9EOBFsoM9NLeBf7eQcpErKaT/FS3
	RHN9WsfdgAWQ17+uId4vuQr9LHZo8L/6hNKau82h8PqQZk2GGBI3gul0elCvpnHRjwPg
	A3uliIymAU9tQn81L9n37XKfJw9i54ALHbTvGMqGCrb5nn/9ffu6qicCPnIdOMtrvVFV
	UDbQUNLjXJOOQiJXZF47CTSqJqFMeFmNeWx+iuaJNMVjzeR8OPhVljl4fIL3Xyu+kGbg
	dTMg==
X-Gm-Message-State: APjAAAUZhKiuh5RnzwgAE1Uw71jWULOsrReOvRt+kTUvi829UjWhHd4Z
	2E4A2+St8BI9tasnE0gZWiugaA==
X-Google-Smtp-Source: APXvYqxLPDAlLeyMbcJ66s5qx51UpP2ouQ1zTec9Dt4SRWeQgeDYKf/fWo/nLgpY5OFrjijmoQ7iwQ==
X-Received: by 2002:ac8:5204:: with SMTP id r4mr12538545qtn.332.1567476634260; 
	Mon, 02 Sep 2019 19:10:34 -0700 (PDT)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net.
	[71.184.117.43]) by smtp.gmail.com with ESMTPSA id
	p126sm7897774qkc.84.2019.09.02.19.10.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Sep 2019 19:10:33 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: "Rework enabling/disabling of ATS for PCI masters" failed to compile
	on arm64
Message-Id: <63FF6963-E1D9-4C65-AD2E-0E4938D08584@lca.pw>
Date: Mon, 2 Sep 2019 22:10:30 -0400
To: Will Deacon <will@kernel.org>
X-Mailer: Apple Mail (2.3445.104.11)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
	Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
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

VGhlIGxpbnV4LW5leHQgY29tbWl0IOKAnGlvbW11L2FybS1zbW11LXYzOiBSZXdvcmsgZW5hYmxp
bmcvZGlzYWJsaW5nIG9mIEFUUyBmb3IgUENJIG1hc3RlcnPigJ0gWzFdIGNhdXNlcyBhIGNvbXBp
bGF0aW9uIGVycm9yIHdoZW4gUENJX0FUUz1uIG9uIGFybTY0LgoKWzFdIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LWlvbW11LzIwMTkwODIwMTU0NTQ5LjE3MDE4LTMtd2lsbEBrZXJuZWwu
b3JnLwoKZHJpdmVycy9pb21tdS9hcm0tc21tdS12My5jOjIzMjU6MzU6IGVycm9yOiBubyBtZW1i
ZXIgbmFtZWQgJ2F0c19jYXAnIGluICdzdHJ1Y3QgcGNpX2RldicKICAgICAgICByZXR1cm4gIXBk
ZXYtPnVudHJ1c3RlZCAmJiBwZGV2LT5hdHNfY2FwOwogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIH5+fn4gIF4KCkZvciBleGFtcGxlLAoKU3ltYm9sOiBQQ0lfQVRTIFs9bl0KICDi
lIIgVHlwZSAgOiBib29sCiAg4pSCICAgRGVmaW5lZCBhdCBkcml2ZXJzL3BjaS9LY29uZmlnOjEx
OAogIOKUgiAgIERlcGVuZHMgb246IFBDSSBbPXldIAogIOKUgiAgIFNlbGVjdGVkIGJ5IFtuXTog
CiAg4pSCICAgLSBQQ0lfSU9WIFs9bl0gJiYgUENJIFs9eV0gCiAg4pSCICAgLSBQQ0lfUFJJIFs9
bl0gJiYgUENJIFs9eV3ilIIgIAogIOKUgiAgIC0gUENJX1BBU0lEIFs9bl0gJiYgUENJIFs9eV0g
4pSCICAKICDilIIgICAtIEFNRF9JT01NVSBbPW5dICYmIElPTU1VX1NVUFBPUlQgWz15XSAmJiBY
ODZfNjQgJiYgUENJIFs9eV0gJiYgQUNQSSBbPXldCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby9pb21tdQ==
