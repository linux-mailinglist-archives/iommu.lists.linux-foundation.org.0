Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E979327DEE6
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 05:20:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9FDB885F57;
	Wed, 30 Sep 2020 03:20:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rdLgjOruwqzC; Wed, 30 Sep 2020 03:20:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D025385DF5;
	Wed, 30 Sep 2020 03:20:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA488C0890;
	Wed, 30 Sep 2020 03:20:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BDFA4C016F
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 03:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9E8918679C
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 03:20:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nyn-KqNr-img for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 03:20:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DA74E86792
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 03:20:02 +0000 (UTC)
IronPort-SDR: YxOY/5y58CgDmTkP5K7dfuYKXrU7RMJDrPRxL30ohWmkOg44cBe7JoYSrE706+CVtyAP3t8KG+
 9JlZh+Uh33mQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="163216910"
X-IronPort-AV: E=Sophos;i="5.77,320,1596524400"; d="scan'208";a="163216910"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 20:19:57 -0700
IronPort-SDR: R5ndLVjh4n4owuZfDaSMx+qaaVsnhnBSI3csNnLVfCfApQ4tyT5Pd9m6FwwR+Imjnq9muqhYUA
 DKZzkFmnIHmQ==
X-IronPort-AV: E=Sophos;i="5.77,320,1596524400"; d="scan'208";a="457502301"
Received: from xinpan-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.35.239])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 20:19:54 -0700
Date: Wed, 30 Sep 2020 06:19:52 +0300
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 05/13] x86: Add early TPM1.2/TPM2.0 interface support for
 Secure Launch
Message-ID: <20200930031952.GA880396@linux.intel.com>
References: <1600959521-24158-1-git-send-email-ross.philipson@oracle.com>
 <1600959521-24158-6-git-send-email-ross.philipson@oracle.com>
 <20200925054313.GB165011@linux.intel.com>
 <bf1d8df9-ec79-2cc6-534f-ce1f0a58f123@apertussolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf1d8df9-ec79-2cc6-534f-ce1f0a58f123@apertussolutions.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: linux-doc@vger.kernel.org, Ross Philipson <ross.philipson@oracle.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org, luto@amacapital.net,
 iommu@lists.linux-foundation.org, mingo@redhat.com, bp@alien8.de,
 hpa@zytor.com, linux-integrity@vger.kernel.org,
 trenchboot-devel@googlegroups.com, tglx@linutronix.de
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, Sep 29, 2020 at 07:47:52PM -0400, Daniel P. Smith wrote:
> TrenchBoot's AMD Secure Loader (LZ). The former is not well supported
> and the latter will be getting maintenance under TB. While this is not
> preferred, we had to weigh this versus trying to convince you and the
> other TPM driver maintainers on a significant refactoring of the TPM
> driver. It was elected for the reuse of a clean implementation that can
> be replaced later if/when the TPM driver was refactored. When we
> explained this during the RFC and it was not rejected, therefore we
> carried it forward into this submission.

What does it anyway mean when you say "RFC was not rejected"? I don't
get the semantics of that sentence. It probably neither was ack'd,
right? I do not really care what happened with the RFC. All I can say
is that in the current state this totally PoC from top to bottom.

> > How it is now is never going to fly.
> 
> We would gladly work with you and the other TPM maintainers on a
> refactoring of the TPM driver to separate core logic into standalone
> files that both the driver and the compressed kernel can share.

Yes, exactly. You have to refactor out the common parts. This is way too
big patch to spend time on giving any more specific advice. Should be in
way smaller chunks. For (almost) any possible, this is of unacceptable
size.

I think that it'd be best first to keep the common files in
drivers/char/tpm and include them your code with relative paths in the
Makefile. At least up until we have clear view what are the common
parts.

You might also want to refactor drivers/char/tpm/tpm.h and include/linux
TPM headers to move more stuff into include/linux.

If you are expecting a quick upstreaming process, please do not. This
will take considerable amount of time to get right.

/Jarkko
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
