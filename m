Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B187C8D4
	for <lists.iommu@lfdr.de>; Wed, 31 Jul 2019 18:36:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B90663EAC;
	Wed, 31 Jul 2019 16:36:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 266703CD5
	for <iommu@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 16:22:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7AAAEA8
	for <iommu@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 16:22:23 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g17so70359716wrr.5
	for <iommu@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 09:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arista.com; s=googlenew;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fMsIsafJcgydqieWtyKK37V7eK4LkebHJjWC8cS/T/c=;
	b=lrI/WQG7zcEbxu87Ge/KhadS8/uzovKj4UxBeqaVQeeh/IJ6jb3P643H1Mjg8TUypR
	iz6C2ioCKKiAguMR5M2Uue2OVu85XP+jv0N+hgAKuemRZFVXmynMumZo98x3LP6JpwQt
	mkfBooJZ3wchfoHTuvNtXFJq9j8Fwt7cYiXr9RqXyUjStPA4z+ex0pqJ2gWnT6n/AiDp
	FqNIKsenIcbbYFFNACv86D4ne3STNFKe/Sk1b/JQhun5jsEI68Estd5Do6Bo2SOzWqOx
	p8uu07fe3K01R7/0m9eismadng56pWsMD7FQE74aWr3l84HtWiK7qvMfwGmFPE4g0Wop
	CxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fMsIsafJcgydqieWtyKK37V7eK4LkebHJjWC8cS/T/c=;
	b=SxF58skIyvgbBuiMHvVPmkVw8f4TI/+cEJk9wSHaNKcP54xPxH2xAac9p0W58ads1d
	zHngXuxLPxJNCgKGNFtm98Oke4WN4kDSR2OFIz6rPRJH3Zc0cfMDMAFdc57grOFp2aGF
	ROouBzTR6HUVbKQElhgla6R3BYJSdT7EXUZ+rQMdsqIdWuAXpYN+MfkJKzc4fJaY9l4V
	uNXmfl0q3WrUGt3CkzvWUDf7PeuzFdV9B0YjVsu2oz0sbSZhqEl56qj1DtMbamvcSfTg
	zC6zeNKnJDznmf8r0sAuxWBkOpp4ANBawBfBz1h5ihSikzwEl4822X2X4l2zeeOi+jS+
	S2UA==
X-Gm-Message-State: APjAAAXMrZ0f3L049NNbrP/Iwik1prk8YipbzpyN6PRQphXiZf92Dvcn
	DRM94x4q3BikKUhZ22uMy8MRkvWWuluIEvJIZjwEBWVVApQ4PrZ6JMM0e4N+YkQjGTySbrRvFtg
	ExVEXKXTJciCZ2r6QPP5K2htdncmY3hF4V+F3h4U1glwDTOkVqf88lj7ut0J9OriXQKzVk3F9ux
	tl0d0H3uCVY9ncqDdnVJX24qLcNuKyqcRg5MM7QUvFRJgP
X-Google-Smtp-Source: APXvYqwmyHO/G5Qdz7Loyy4J0DUGudZgyuCTSX2O9MI62Ekd+VoR+lyIQy0vaNv8nJDQCyBNI7ETyw==
X-Received: by 2002:a5d:46cf:: with SMTP id g15mr140203821wrs.93.1564590142064;
	Wed, 31 Jul 2019 09:22:22 -0700 (PDT)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
	by smtp.gmail.com with ESMTPSA id
	n9sm114557717wrp.54.2019.07.31.09.22.21
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 31 Jul 2019 09:22:21 -0700 (PDT)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Subject: [PATCH-4.19-stable 0/2] iommu/vt-d: queue_iova() boot crash backport
Date: Wed, 31 Jul 2019 17:22:18 +0100
Message-Id: <20190731162220.24364-1-dima@arista.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CLOUD-SEC-AV-Info: arista,google_mail,monitor
X-CLOUD-SEC-AV-Sent: true
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Joerg Roedel <jroedel@suse.de>, Dmitry Safonov <dima@arista.com>,
	0x7f454c46@gmail.com, iommu@lists.linux-foundation.org,
	David Woodhouse <dwmw2@infradead.org>
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
From: Dmitry Safonov via iommu <iommu@lists.linux-foundation.org>
Reply-To: Dmitry Safonov <dima@arista.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Backport commits from master that fix boot failure on some intel
machines.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Joerg Roedel <jroedel@suse.de>
Cc: Lu Baolu <baolu.lu@linux.intel.com>

Dmitry Safonov (1):
  iommu/vt-d: Don't queue_iova() if there is no flush queue

Joerg Roedel (1):
  iommu/iova: Fix compilation error with !CONFIG_IOMMU_IOVA

 drivers/iommu/intel-iommu.c |  2 +-
 drivers/iommu/iova.c        | 18 ++++++++++++++----
 include/linux/iova.h        |  6 ++++++
 3 files changed, 21 insertions(+), 5 deletions(-)

-- 
2.22.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
